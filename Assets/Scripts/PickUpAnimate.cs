using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpAnimate : MonoBehaviour
{
    // Rotation speed (degrees per second)
    public float rotationSpeed = 100f;

    // Sine wave movement parameters
    public float amplitude = 1f; // Height of the sine wave
    public float frequency = 1f; // Speed of the sine wave

    // Initial position of the object
    private Vector3 initialPosition;

    void Start()
    {
        // Save the initial position of the object
        initialPosition = transform.position;
    }

    void Update()
    {
        // Rotate the object around its Y-axis
        transform.Rotate(Vector3.up, rotationSpeed * Time.deltaTime);

        // Calculate the new Y position based on a sine wave
        float newY = initialPosition.y + Mathf.Sin(Time.time * frequency) * amplitude;

        // Update the position of the object
        transform.position = new Vector3(initialPosition.x, newY, initialPosition.z);
    }

}
