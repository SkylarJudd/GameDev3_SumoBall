using UnityEngine;

public class LookAt : MonoBehaviour
{
    [SerializeField] Transform target; // Target to move towards and look at
    [SerializeField] bool lockXRotation = false;
    [SerializeField] bool lockYRotation = false;
    [SerializeField] bool lockZRotation = false;
    [SerializeField] float rotationSpeed = 5f; // Speed of rotation
    [SerializeField] float springConstant = 50f; // The spring constant for rotation
    [SerializeField] float damping = 5f; // Damping factor for rotation

    private Vector3 rotationVelocity = Vector3.zero; // Current rotational velocity of the game object

    void Update()
    {
        RotateTowardsTarget();
    }

    private void RotateTowardsTarget()
    {
        if (target == null)
        {
            return;
        }

        // Calculate the direction to the target
        Vector3 direction = target.position - transform.position;

        // Calculate the desired rotation
        Quaternion targetRotation = Quaternion.LookRotation(direction);

        // Decompose the target rotation into Euler angles
        Vector3 targetEulerAngles = targetRotation.eulerAngles;

        // Lock rotations based on the bools
        Vector3 currentEulerAngles = transform.rotation.eulerAngles;
        if (lockXRotation)
        {
            targetEulerAngles.x = currentEulerAngles.x;
        }
        if (lockYRotation)
        {
            targetEulerAngles.y = currentEulerAngles.y;
        }
        if (lockZRotation)
        {
            targetEulerAngles.z = currentEulerAngles.z;
        }

        // Apply the target Euler angles to a quaternion
        targetRotation = Quaternion.Euler(targetEulerAngles);

        // Calculate the spring force
        Quaternion currentRotation = transform.rotation;
        Quaternion deltaRotation = targetRotation * Quaternion.Inverse(currentRotation);
        Vector3 deltaEuler = deltaRotation.eulerAngles;
        if (deltaEuler.x > 180) deltaEuler.x -= 360;
        if (deltaEuler.y > 180) deltaEuler.y -= 360;
        if (deltaEuler.z > 180) deltaEuler.z -= 360;
        Vector3 springForce = deltaEuler * springConstant;
        Vector3 dampingForce = rotationVelocity * damping;

        // Update rotational velocity
        rotationVelocity += (springForce - dampingForce) * Time.deltaTime;

        // Update the rotation using the rotation speed
        Vector3 newEulerAngles = currentEulerAngles + rotationVelocity * rotationSpeed * Time.deltaTime;
        transform.rotation = Quaternion.Euler(newEulerAngles);
    }
}


