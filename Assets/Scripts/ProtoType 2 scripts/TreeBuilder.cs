using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeBuilder : MonoBehaviour
{
    [SerializeField] GameObject[] Logs;
    [SerializeField] GameObject branchPrefab;

    [SerializeField] GameObject player;
    [SerializeField] float treeOffset = 16f;
    [SerializeField] int playerHeight = 0;
    [SerializeField] float moveCooldown = 0.5f; // Cooldown time in seconds

    private float lastMoveTime = 0f;

    private void Update()
    {
        if (Time.time - lastMoveTime < moveCooldown)
        {
            return; // Prevent further execution if still in cooldown
        }

        if (Input.GetKeyDown(KeyCode.U))
        {
            MoveTreeUp();
        }
        if (Input.GetKeyDown(KeyCode.J))
        {
            MoveTreeDown();
        }

        if (player.transform.position.y - 4f > treeOffset * playerHeight)
        {
            MoveTreeUp();
        }
        else if (player.transform.position.y - 2f < treeOffset * playerHeight)
        {
            MoveTreeDown();
        }
    }

    public void MoveTreeUp()
    {
        playerHeight++;
        lastMoveTime = Time.time; // Reset the cooldown timer

        // Store the last element
        GameObject lastElement = Logs[Logs.Length - 1];

        // Shift all elements down by one
        for (int i = Logs.Length - 1; i > 0; i--)
        {
            Logs[i] = Logs[i - 1];
        }

        // Move the last element to the top
        Logs[0] = lastElement;

        // Update the position of the moved log
        Vector3 newPosition = Logs[0].transform.position;
        newPosition.y = Logs[1].transform.position.y + treeOffset; // Update the y position
        Logs[0].transform.position = newPosition;
    }

    public void MoveTreeDown()
    {
        playerHeight--;
        lastMoveTime = Time.time; // Reset the cooldown timer

        // Store the first element
        GameObject firstElement = Logs[0];

        // Shift all elements up by one
        for (int i = 0; i < Logs.Length - 1; i++)
        {
            Logs[i] = Logs[i + 1];
        }

        // Move the first element to the bottom
        Logs[Logs.Length - 1] = firstElement;

        // Update the position of the moved log
        Vector3 newPosition = Logs[Logs.Length - 1].transform.position;
        newPosition.y = Logs[Logs.Length - 2].transform.position.y - treeOffset; // Update the y position
        Logs[Logs.Length - 1].transform.position = newPosition;
    }

    private void SpawnBranch()
    {
        // Implement branch spawning logic here
    }
}