using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class RobotPlayerController : MonoBehaviour
{
    [SerializeField] GameObject player;
    [SerializeField] Collider sphereCollider;
    [SerializeField] Collider robotCollider;
    [SerializeField] Transform floorHeight;
    [SerializeField] float speed = 1.0f;
    [SerializeField] Camera mainCamera; 
    Vector2 _input;
    Vector2 _input2;
    Vector3 _direction;
    float sphereRadius;

    private void Start()
    {
        // Assuming the collider is a sphere collider
        sphereRadius = sphereCollider.bounds.extents.x; // Radius of the sphere
    }

    public void Update()
    {
        MovePlayer();
    }

    public void camLook(InputAction.CallbackContext _context)
    {
        // Camera look logic here
    }

    public void Move(InputAction.CallbackContext _context)
    {
        _input = _context.ReadValue<Vector2>();

        // Get the forward and right direction of the camera
        Vector3 forward = mainCamera.transform.forward;
        Vector3 right = mainCamera.transform.right;

        // Project the forward and right direction onto the XZ plane (ignore the y component)
        forward.y = 0;
        right.y = 0;
        forward.Normalize();
        right.Normalize();

        // Calculate the desired direction based on input and camera direction
        _direction = (forward * _input.y + right * _input.x).normalized;
    }

    public void MoveUpAndDown(InputAction.CallbackContext _context)
    {
        _input2 = _context.ReadValue<Vector2>();
        _direction = new Vector3(0, _input2.y, 0).normalized;
    }

    private void MovePlayer()
    {
        Vector3 newPosition = player.transform.position + _direction * Time.deltaTime * speed;

        // Calculate the offset from the center of the sphere
        Vector3 center = sphereCollider.transform.position;
        Vector3 offset = newPosition - center;

        // Check if the new position is outside the sphere
        if (offset.magnitude > sphereRadius)
        {
            // Clamp the position to the sphere's surface
            offset = offset.normalized * sphereRadius;
            newPosition = center + offset;
        }

        // Check if the new position is below the floor height
        if (newPosition.y < floorHeight.position.y)
        {
            newPosition.y = floorHeight.position.y;
        }
        // Check if the new position is inside the robot collider
        if (robotCollider.bounds.Contains(newPosition))
        {
            // Push the player out of the robot collider
            Vector3 closestPoint = robotCollider.ClosestPoint(newPosition);
            Vector3 pushDirection = (newPosition - closestPoint).normalized;
            newPosition = closestPoint + pushDirection * 0.1f; // Add a small offset to prevent re-entering
        }

        player.transform.position = newPosition;
    }
}
