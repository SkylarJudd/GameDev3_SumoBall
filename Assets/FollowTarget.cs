using UnityEngine;

public class FollowTarget : MonoBehaviour
{
    // The target object that this object will follow
    public Transform target;

    // The offset to apply to the position
    public Vector3 positionOffset;

    // The offset to apply to the rotation
    public Vector3 rotationOffset;

    // Update is called once per frame
    void Update()
    {
        if (target != null)
        {
            // Follow the target's position with offset
            transform.position = target.position + positionOffset;

            // Follow the target's rotation with offset
            transform.rotation = target.rotation * Quaternion.Euler(rotationOffset);
        }
    }
}
