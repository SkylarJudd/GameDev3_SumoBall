using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public enum PlayerNumber
{
    PlayerOne, PlayerTwo, PlayerThree, PlayerFour,
}


[Serializable]
public class Player
{
    public GameObject playerGO;
    public float maxMoveSpeed;          // The maximum speed the player can reach
    public float acceleration = 2.0f;   // How fast the player accelerates
    public float deceleration = 2.0f;   // How fast the player decelerates
    public float playerRotateSpeed;     // How fast the player rotates
    public Vector2 input;               // Player input for movement

    public float currentSpeed = 0.0f;   // The player's current movement speed
    public float lastInputDirection = 0.0f; // Last recorded direction (1 for forward, -1 for backward)
    public bool isBouncing = false;     // Tracks if the player is currently bouncing off the wall
    public bool isRotatingAfterBounce = false; // Tracks if the player is finishing rotation after bounce

    public Animator fishAnimator;       // Animator for the fish
}

public class FishPongPlayerController : MonoBehaviour
{
    [SerializeField]
    private List<Player> playerList = new List<Player>();

    [Header("Playable Area")]
    [SerializeField]
    private float bounds = 5.0f;

    [Header("Bounce Settings")]
    [SerializeField]
    private float bounceSpeedMultiplier = 0.75f;  // Adjusts how fast the player moves after bouncing

    public void PlayerOneInput(InputAction.CallbackContext _context)
    {
        playerList[0].input = _context.ReadValue<Vector2>();
    }

    public void PlayerTwoInput(InputAction.CallbackContext _context)
    {
        playerList[1].input = _context.ReadValue<Vector2>();
    }

    private void Update()
    {
        foreach (Player _player in playerList)
        {
            UpdatePlayerMovement(_player);
        }
    }

    private void UpdatePlayerMovement(Player _player)
    {
        // Handle movement acceleration/deceleration
        HandleAcceleration(_player);

        // Clamp the player's speed
        ClampPlayerSpeed(_player);

        // Move the player and check for wall collisions (bounce)
        MovePlayer(_player);

        // Rotate the player, ensuring full rotation after bouncing
        RotatePlayer(_player);

        // Update the animator's Speed parameter
        UpdateAnimatorSpeed(_player);
    }

    private void HandleAcceleration(Player _player)
    {
        float currentAcceleration = _player.acceleration;

        if (_player.input.x != 0)
        {
            float inputDirection = Mathf.Sign(_player.input.x);

            // If direction changes, halve the acceleration
            if (inputDirection != _player.lastInputDirection && _player.currentSpeed > 0)
            {
                currentAcceleration *= 0.5f;
            }

            _player.lastInputDirection = inputDirection;
            _player.currentSpeed += currentAcceleration * Time.deltaTime;
            _player.isBouncing = false;  // Reset bounce state when the player inputs a direction
        }
        else
        {
            // Decelerate when there's no input
            _player.currentSpeed -= _player.deceleration * Time.deltaTime;
        }
    }

    private void ClampPlayerSpeed(Player _player)
    {
        // Ensure the player's speed stays within bounds
        _player.currentSpeed = Mathf.Clamp(_player.currentSpeed, 0, _player.maxMoveSpeed);
    }

    private void MovePlayer(Player player)
    {
        // Move player based on current speed and last input direction
        Vector3 newPos = player.playerGO.transform.position;
        newPos.z += player.currentSpeed * player.lastInputDirection * Time.deltaTime;

        // Check if the player hits the bounds
        if (Mathf.Abs(newPos.z) >= bounds)
        {
            BouncePlayer(player);  // Handle bounce when hitting bounds
        }
        else
        {
            // Apply the new position
            player.playerGO.transform.position = newPos;
        }
    }

    private void BouncePlayer(Player _player)
    {
        // If the player hits the wall, reverse their direction
        _player.lastInputDirection *= -1;

        // Reduce speed slightly to simulate bounce
        _player.currentSpeed *= bounceSpeedMultiplier;

        // Update the position after the bounce
        Vector3 newPos = _player.playerGO.transform.position;
        newPos.z = Mathf.Clamp(newPos.z, -bounds, bounds);

        // Apply the new position after bouncing
        _player.playerGO.transform.position = newPos;

        _player.isBouncing = true;
        _player.isRotatingAfterBounce = true; // Ensure player completes rotation after bounce
    }

    private void RotatePlayer(Player _player)
    {
        // If the player is moving or needs to complete rotation after bouncing
        if (_player.currentSpeed > 0 || _player.isRotatingAfterBounce)
        {
            Vector3 moveDirection = new Vector3(0, 0, _player.lastInputDirection);
            Quaternion targetRotation = Quaternion.LookRotation(moveDirection, Vector3.up);

            // Smoothly rotate towards the target direction
            _player.playerGO.transform.rotation = Quaternion.Lerp(
                _player.playerGO.transform.rotation,
                targetRotation,
                _player.playerRotateSpeed * Time.deltaTime
            );

            // Check if the rotation is close enough to be considered complete
            if (Quaternion.Angle(_player.playerGO.transform.rotation, targetRotation) < 1f)
            {
                _player.isRotatingAfterBounce = false;  // Stop rotating once aligned
            }
        }
    }

    private void UpdateAnimatorSpeed(Player _player)
    {
        // Normalize the current speed relative to maxMoveSpeed (range 0 to 1)
        float normalizedSpeed = _player.currentSpeed / _player.maxMoveSpeed;

        // Set the 'Speed' parameter in the animator
        _player.fishAnimator.SetFloat("Speed", normalizedSpeed);
    }
}