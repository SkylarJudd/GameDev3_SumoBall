using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class KoalaPlayerControllerTwo : MonoBehaviour
{

    [SerializeField] GameObject leftHand;
    [SerializeField] GameObject rightHand;
    [SerializeField] GameObject body;

    [SerializeField] Transform leftShoulder;
    [SerializeField] Transform rightShoulder;

    [SerializeField] float shoulderWidth;
    [SerializeField] float MaxArmWidth;

    [SerializeField] float moveSpeed;

    [SerializeField] float playerYOffect = 0f;

    [SerializeField] float maxRadius;


    float moveDirectionX;
    float moveDirectionY;

    [SerializeField] bool toggleHands;
    private void ToggleHands()
    {
        toggleHands = !toggleHands;
        Debug.Log("Hands toggled: " + toggleHands);
    }

    void Update()
    {
        if (toggleHands)
            UpdateLeftHand();
        else
            UpdateRightHand();

        if (Input.GetKeyDown(KeyCode.Space))
            ToggleHands();

        UpdatePlayersBody();
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

    private void MoveHand(GameObject hand, Vector3 shoulderPos)
    {
        hand.transform.position = hand.transform.position + new Vector3(moveDirectionX * Time.deltaTime * moveSpeed, moveDirectionY * Time.deltaTime * moveSpeed, 0);
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

    private void UpdatePlayersBody()
    {
        // Calculate the midpoint
        Vector3 midpoint = (leftHand.transform.position + rightHand.transform.position) / 2;

        // Add the yOffset to the midpoint's y-coordinate
        midpoint.y += playerYOffect;

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
}
