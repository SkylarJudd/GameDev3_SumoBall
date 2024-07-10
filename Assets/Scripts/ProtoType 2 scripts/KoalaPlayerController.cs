
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class KoalaPlayerController : MonoBehaviour
{
    public bool toggleHands;
    public bool tutorialDone = false;

    [SerializeField] GameObject leftHand;
    [SerializeField] GameObject rightHand;
    [SerializeField] GameObject body;

    [SerializeField] Transform leftShoulder;
    [SerializeField] Transform rightShoulder;

    [SerializeField] GameObject[] trees;

   
    [SerializeField] float moveSpeed;
    [SerializeField] float maxRadius;
    [SerializeField] float driftSpeed = 0.5f; // Speed at which the hand drifts downward
    [SerializeField] float yOffset = 0f;

    [SerializeField] float handRadius = 0.5f; // Radius of the hands for collision checks
    [SerializeField] LayerMask collisionLayer; // Layer mask to specify which layers to check for collisions

    [SerializeField] GameObject[] branchPrefab; // The prefab for the branch
    [SerializeField] GameObject branchPerent;
    [SerializeField] float branchSpawnDistance = 8f; // Distance the player must climb to spawn a new branch
    [SerializeField] float branchRange = 20f; // Range to keep the branches within the player’s view
    [SerializeField] float branchOffset = 8f;
    [SerializeField] float branchRotateSpeed = 75f;

    [SerializeField] Slider drunknessSlider;
    [SerializeField] Slider energySlider;
    [SerializeField] TMP_Text drunkValue;
    [SerializeField] TMP_Text energyValue;

    [SerializeField] TMP_Text currentHight;


    [SerializeField] Material handOnMat;
    [SerializeField] Material handOffMat;
    [SerializeField] Renderer rightHandRender;
    [SerializeField] Renderer leftHandRender;

    [SerializeField] KeyVisuals keyVisuals;

    private Vector3 leftHandStartPos;
    private Vector3 rightHandStartPos;

    private float drunkX;
    private float drunkY;

    private Vector3 drunkLerped;

    private float drunkness;
    private float energy;

    private float rotateTreeOffset = 1f;

    private Material[] treeMaterials; // Array to store the materials of the tree's renderers
    private Vector2[] uvOffsets; // Array to store the current UV offsets of the tree textures

    float moveDirectionX;
    float moveDirectionY;

    private float lastBranchYPosition = 0f; // To keep track of the last Y position where a branch was spawned
    private List<GameObject> branches = new List<GameObject>(); // List to keep track of the branches

    


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

        CheckBranchSpawn(); // Check if we need to spawn a new branch
        CheckBranchDestruction(); // Check if any branches need to be destroyed

        if (Input.GetMouseButtonDown(0))
        {
            drunkness = 0f;
            energy = 1f;
        }

        currentHight.text = body.transform.position.y.ToString("##.##");
    }

    void Start()
    {
        leftHandStartPos = leftHand.transform.position;
        rightHandStartPos = rightHand.transform.position;

        StartCoroutine(drunkHands());
        StartCoroutine(LerpDrunkHands());
        SpawnBranch();

        if (trees != null && trees.Length > 0)
        {
            treeMaterials = new Material[trees.Length];
            uvOffsets = new Vector2[trees.Length];

            for (int i = 0; i < trees.Length; i++)
            {
                Renderer treeRenderer = trees[i].GetComponent<Renderer>();
                if (treeRenderer != null)
                {
                    treeMaterials[i] = treeRenderer.material;
                }
                uvOffsets[i] = Vector2.zero;
            }
        }

        ChangeHandColour();
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

        // Check for collisions before updating the hand position
        if (!Physics.CheckSphere(newPosition, handRadius, collisionLayer))
        {
            hand.transform.position = newPosition;
        }
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

            updateSliderValues();
        }
    }

    private void ToggleHands()
    {
        toggleHands = !toggleHands;
        ChangeHandColour();
        //Debug.Log("Hands toggled: " + toggleHands);
    }

    private void ChangeHandColour()
    {
        if (toggleHands)
        {
            rightHandRender.material = handOffMat;
            leftHandRender.material = handOnMat;
        }
        else
        {
            rightHandRender.material = handOnMat;
            leftHandRender.material = handOffMat;
        }
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

            // Apply rotation to the branch parent
            Quaternion currentRotation = branchPerent.transform.rotation;
            branchPerent.transform.rotation = currentRotation * Quaternion.Euler(0f, moveAmount * branchRotateSpeed, 0f);

            // Scroll the textures' UVs based on the movement
            if (treeMaterials != null)
            {
                for (int i = 0; i < treeMaterials.Length; i++)
                {
                    if (treeMaterials[i] != null)
                    {
                        uvOffsets[i].x += moveAmount * 0.1f; // Adjust this multiplier to control the scrolling speed
                        treeMaterials[i].SetTextureOffset("_MainTex", uvOffsets[i]);
                    }
                }
            }

        }
    }

    private void CheckBranchSpawn()
    {
        // Get the current Y position of the body
        float currentY = body.transform.position.y;

        // Check if the player has climbed beyond the branch spawn distance
        if (currentY - lastBranchYPosition >= branchSpawnDistance)
        {
            SpawnBranch();
            lastBranchYPosition += branchSpawnDistance + Random.Range(-branchSpawnDistance / 4, branchSpawnDistance / 4); // Update the last branch Y position
        }
    }

    private void SpawnBranch()
    {
        // Instantiate the branch prefab
        GameObject newBranch = Instantiate(branchPrefab[Random.Range(0, branchPrefab.Length)], branchPerent.transform); //perent to branchPerent

        // Set the position of the new branch
        Vector3 branchPosition = new Vector3(0, body.transform.position.y + branchOffset, 5.96f);
        newBranch.transform.position = branchPosition;

        // Set a random rotation on the Y axis
        float randomYRotation = Random.Range(0f, 360f); // Random rotation between 0 and 360 degrees
        newBranch.transform.rotation = Quaternion.Euler(0f, randomYRotation, 0f); // Apply the rotation

        // Add the branch to the list
        branches.Add(newBranch);
    }

    private void CheckBranchDestruction()
    {
        // Get the current Y position of the body
        float currentY = body.transform.position.y;

        // Iterate through the list of branches and destroy those out of range
        for (int i = branches.Count - 1; i >= 0; i--)
        {
            GameObject branch = branches[i];
            float branchY = branch.transform.position.y;

            // Check if the branch is out of the player’s vertical range
            if (Mathf.Abs(currentY - branchY) > branchRange)
            {
                // Destroy the branch and remove it from the list
                Destroy(branch);
                branches.RemoveAt(i);
            }
        }
    }

    public void addtoDrunk(float value)
    {
        drunkness += value;

        if (drunkness + value < 2)
            drunkness += value;
        else
            drunkness = 2;

        updateSliderValues();

        if (!tutorialDone)
        {
            keyVisuals.turnOffControls();
            tutorialDone = true;
        }

    }
    public void addToEnergy(float value)
    {
        if (energy + value < 1)
            energy += value;
        else
            energy = 1;

        updateSliderValues();
    }

    private void updateSliderValues()
    {
        drunknessSlider.value = drunkness;
        energySlider.value = energy;

        drunkValue.text = drunkness.ToString("##.#");
        energyValue.text = energy.ToString("##.#");
    }
}