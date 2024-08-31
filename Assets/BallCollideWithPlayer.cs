using UnityEngine;

public class BallCollideWithPlayer : MonoBehaviour
{
    private void OnCollisionEnter(Collision collision)
    {
        PongBall ball = collision.gameObject.GetComponent<PongBall>();
        if (ball != null)
        {
            // Get the normal of the collision point
            Vector3 normal = collision.contacts[0].normal;
            ball.Bounce(normal);
        }
    }
}
