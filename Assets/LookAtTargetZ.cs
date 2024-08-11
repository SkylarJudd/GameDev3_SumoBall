using UnityEngine;

public class LookAtTargetWithOffset : MonoBehaviour
{
    // The target object that this object will look at
    public Transform target;

    // The offset to apply to the rotation
    public Vector3 rotationOffset;

    // Update is called once per frame
    void Update()
    {
        if (target != null)
        {
            // Make the object look at the target
            transform.LookAt(target);

            // Apply the offset to the rotation
            transform.rotation = transform.rotation * Quaternion.Euler(rotationOffset);
        }
    }
}