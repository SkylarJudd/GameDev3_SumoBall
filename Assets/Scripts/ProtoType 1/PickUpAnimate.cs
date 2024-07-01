using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpAnimate : MonoBehaviour
{
    public float rotationSpeed = 100f;

    public float amplitude = 1f; 
    public float frequency = 1f; 

    private Vector3 initialPosition;

    void Start()
    {
        initialPosition = transform.position;
    }

    void Update()
    {
        transform.Rotate(Vector3.up, rotationSpeed * Time.deltaTime);
        float newY = initialPosition.y + Mathf.Sin(Time.time * frequency) * amplitude;

        transform.position = new Vector3(initialPosition.x, newY, initialPosition.z);
    }

}
