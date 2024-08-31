using UnityEngine;

public class CollisionHandler : MonoBehaviour
{
    private int objectIndex;
    private RopeManager ropeManager;

    // Initializes the CollisionHandler with the index and reference to RopeManager
    public void Initialize(int index, RopeManager manager)
    {
        objectIndex = index;
        ropeManager = manager;
    }

    void OnTriggerEnter(Collider other)
    {
        // Check if the colliding object has a PongBall component
        PongBall pongBall = other.GetComponent<PongBall>();
        if (pongBall != null)
        {
            ropeManager.HandleCollision(objectIndex, other.gameObject);
        }
    }
}
