using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KoalaPlayerController : MonoBehaviour
{
    [SerializeField] GameObject leftHand;
    [SerializeField] GameObject rightHand;
    [SerializeField] GameObject body;

    [SerializeField] Transform leftShoulder;
    [SerializeField] Transform rightShoulder;

    [SerializeField] GameObject tree;

    [SerializeField] bool toggleHands;
    [SerializeField] float moveSpeed;
    [SerializeField] float maxRadius;
    [SerializeField] float driftSpeed = 0.5f; // Speed at which the hand drifts downward
    [SerializeField] float yOffset = 0f;

    


    private Vector3 leftHandStartPos;
    private Vector3 rightHandStartPos;

    private float drunkX;
    private float drunkY;

    private Vector3 drunkLerped;

    private float drunkness;
    private float energy;

    private float rotateTreeOffset = 1f;

    private Material treeMaterial; // The material of the tree's renderer
    private Vector2 uvOffset = Vector2.zero; // The current UV offset of the tree texture





    float moveDirectionX;
    float moveDirectionY;

    void Update()
    {
        if (toggleHands)
            UpdateLeftHand();
        else
            UpdateRightHand();

        if (Input.GetKeyDown(KeyCode.Space))
            ToggleHands();

        UpdatePlayersBody();
        RotateTree();

        if (Input.GetMouseButtonDown(0))
        {
            drunkness = 1;
            energy = 1;
        }
    }

    void Start()
    {
        leftHandStartPos = leftHand.transform.position;
        rightHandStartPos = rightHand.transform.position;

        StartCoroutine(drunkHands());
        StartCoroutine(LerpDrunkHands());

        if (tree != null)
        {
            Renderer treeRenderer = tree.GetComponent<Renderer>();
            if (treeRenderer != null)
            {
                treeMaterial = treeRenderer.material;
            }
        }
    }

    private void UpdateLeftHand()
    {
        moveDirectionX = 0;
        moveDirectionY = 0;

        if (Input.GetKey(KeyCode.W))
        {
            moveDirectionY = 1;
        }
        else if (Input.GetKey(KeyCode.S))
        {
            moveDirectionY = -1;
        }
        if (Input.GetKey(KeyCode.A))
        {
            moveDirectionX = -1;
        }
        else if (Input.GetKey(KeyCode.D))
        {
            moveDirectionX = 1;
        }

        MoveHand(leftHand, leftShoulder.position);
    }

    private void UpdateRightHand()
    {
        moveDirectionX = 0;
        moveDirectionY = 0;

        if (Input.GetKey(KeyCode.UpArrow))
        {
            moveDirectionY = 1;
        }
        else if (Input.GetKey(KeyCode.DownArrow))
        {
            moveDirectionY = -1;
        }
        if (Input.GetKey(KeyCode.LeftArrow))
        {
            moveDirectionX = -1;
        }
        else if (Input.GetKey(KeyCode.RightArrow))
        {
            moveDirectionX = 1;
        }

        MoveHand(rightHand, rightShoulder.position);
    }

    private void MoveHand(GameObject hand, Vector3 shoulderPos)
    {
        // Apply the drift speed when no input is detected
        if (moveDirectionX == 0 && moveDirectionY == 0)
        {
            moveDirectionY = -driftSpeed * Time.deltaTime;
        }

        Vector3 newPosition = hand.transform.position + new Vector3((moveDirectionX + drunkX) * Time.deltaTime * (moveSpeed * energy), (moveDirectionY + drunkY) * Time.deltaTime * (moveSpeed * energy), 0);
        Vector3 offset = newPosition - shoulderPos;

        if (offset.magnitude > maxRadius)
        {
            offset = offset.normalized * maxRadius;
            newPosition = shoulderPos + offset;
        }

        newPosition.z = hand == leftHand ? leftHandStartPos.z : rightHandStartPos.z;
        hand.transform.position = newPosition;
    }

    IEnumerator drunkHands()
    {
        while (true)
        {
            drunkX = Random.Range(-1.0f, 1.0f) * drunkness;
            drunkY = Random.Range(-1.0f, 1.0f) * drunkness;

            yield return new WaitForSeconds(Random.Range(0.2f, 1.5f));
        }

    }

    IEnumerator LerpDrunkHands()
    {
        while (true)
        {
            drunkLerped = new Vector3(Mathf.Lerp(drunkLerped.x, drunkX, Time.deltaTime), Mathf.Lerp(drunkLerped.y, drunkY, Time.deltaTime), 0);
            yield return new WaitForEndOfFrame();

            if (drunkness > 0.0f)
            {
                drunkness = drunkness - Time.deltaTime / 40;
            }
            else if (drunkness < 0.0f)
            {
                drunkness = 0.0f;
            }

            if (energy > 0.0f)
            {
                energy = energy - Time.deltaTime / 80;
            }
            else if (energy < 0.0f)
            {
                energy = 0.0f;
            }

        }
    }

    private void ToggleHands()
    {
        toggleHands = !toggleHands;
        Debug.Log("Hands toggled: " + toggleHands);
    }

    private void UpdatePlayersBody()
    {
        // Calculate the midpoint
        Vector3 midpoint = (leftHand.transform.position + rightHand.transform.position) / 2;

        // Add the yOffset to the midpoint's y-coordinate
        midpoint.y += yOffset;

        // Set the position of the target object to the midpoint
        body.transform.position = midpoint;

        // Calculate the direction from leftHand to rightHand
        Vector3 direction = rightHand.transform.position - leftHand.transform.position;

        // Set the rotation of the target object to be parallel to the line formed by leftHand and rightHand
        if (direction != Vector3.zero) // To avoid zero direction which may cause an error
        {
            body.transform.rotation = Quaternion.LookRotation(direction);
        }
    }

    private void RotateTree()
    {
        if (Mathf.Abs(body.transform.position.x) > rotateTreeOffset)
        {
            float offset = body.transform.position.x > rotateTreeOffset ? rotateTreeOffset : -rotateTreeOffset;

            // Calculate the movement amount
            float moveAmount = body.transform.position.x - offset;

            // Move the player's body back into the range
            body.transform.position = new Vector3(offset, body.transform.position.y, body.transform.position.z);

            // Move the hands the same amount
            leftHand.transform.position -= new Vector3(moveAmount, 0, 0);
            rightHand.transform.position -= new Vector3(moveAmount, 0, 0);

            // Scroll the texture's UVs based on the movement
            if (treeMaterial != null)
            {
                uvOffset.x += moveAmount * 0.1f; // Adjust this multiplier to control the scrolling speed
                treeMaterial.SetTextureOffset("_MainTex", uvOffset);
            }
        }

    }
}