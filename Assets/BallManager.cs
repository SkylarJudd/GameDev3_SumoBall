using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class Ball
{
    [Tooltip("The Game Object Of the Ball")]
    public GameObject ballGO;
    [Tooltip("The Speed of the ball")]
    public float ballSpeed;
    [Tooltip("The Balls Rigid Body")]
    public Rigidbody ballRB;
    [Tooltip("The Balls Sphere Collider")]
    public SphereCollider ballSC;
    [Tooltip("Timestamp for the last time the ball was bounced")]
    public float lastBounceTime;
}

public class BallManager : MonoBehaviour
{
    [Header("Ball Data")]
    [SerializeField]
    private Ball ballOne;
    [SerializeField]
    private Ball ballTwo;

    [SerializeField]
    private float correctStrength;

    [SerializeField]
    private float maxSpeed = 10f; // Maximum speed of the ball

    [Header("Map Data")]
    [SerializeField]
    private BoxCollider ballBounds; // Bounds of the map

    

    private float bounceCooldown = 0.5f; // Cooldown time in seconds

    private void Start()
    {
        Initialize(ballOne, new Vector3(1, 0, 0));
        Initialize(ballTwo, new Vector3(-1, 0, 0));
    }

    private void Update()
    {
        UpdateBallPos(ballOne);
        UpdateBallPos(ballTwo);
    }

   

    private void UpdateBallPos(Ball ball)
    {
        ball.ballRB.AddForce(ball.ballGO.transform.forward * ball.ballSpeed * Time.deltaTime, ForceMode.VelocityChange);

        Vector3 nextPosition = ball.ballGO.transform.position + ball.ballRB.velocity * Time.deltaTime;

        if (!ballBounds.bounds.Contains(nextPosition))
        {
            if (nextPosition.x < ballBounds.bounds.min.x || nextPosition.x > ballBounds.bounds.max.x)
            {
                //ball.ballRB.velocity = new Vector3(-ball.ballRB.velocity.x, ball.ballRB.velocity.y, ball.ballRB.velocity.z);
                BounceBall(ball.ballGO, true);
            }
            if (nextPosition.z < ballBounds.bounds.min.z || nextPosition.z > ballBounds.bounds.max.z)
            {
                //ball.ballRB.velocity = new Vector3(ball.ballRB.velocity.x, ball.ballRB.velocity.y, -ball.ballRB.velocity.z);
                BounceBall(ball.ballGO, false);
            }
        }

        if (ball.ballRB.velocity.magnitude > maxSpeed)
        {
            ball.ballRB.velocity = ball.ballRB.velocity.normalized * maxSpeed;
        }

        //ball.ballGO.transform.position = nextPosition;
    }

    private void Initialize(Ball ball, Vector3 initialDirection)
    {
        ball.ballRB = ball.ballGO.GetComponent<Rigidbody>() ?? ball.ballGO.AddComponent<Rigidbody>();
        ball.ballRB.useGravity = false;
        ball.ballRB.angularDrag = 10f;
        ball.ballRB.constraints = RigidbodyConstraints.FreezeRotation | RigidbodyConstraints.FreezePositionY;

        ball.ballSC = ball.ballGO.GetComponent<SphereCollider>() ?? ball.ballGO.AddComponent<SphereCollider>();
        ball.ballSC.isTrigger = false;

        ball.ballGO.transform.forward = initialDirection;
        ball.ballRB.AddForce(initialDirection * ball.ballSpeed, ForceMode.VelocityChange);
    }

    public void BounceBall(GameObject ballGameObject, bool dir)
    {
        Ball ball = IdentifyBall(ballGameObject);
        if (ball != null && Time.time - ball.lastBounceTime >= bounceCooldown)
        {
            if (dir)
                ball.ballRB.velocity = new Vector3(-ball.ballRB.velocity.x, ball.ballRB.velocity.y, ball.ballRB.velocity.z);
            else
                ball.ballRB.velocity = new Vector3(ball.ballRB.velocity.x, ball.ballRB.velocity.y, -ball.ballRB.velocity.z);

            ball.ballRB.AddForce(ball.ballRB.velocity.normalized * ball.ballSpeed, ForceMode.VelocityChange);
            ball.lastBounceTime = Time.time;

            //Vector3 targetDirection = GetTargetDirection(ball.ballRB.velocity.normalized);

            ball.ballGO.transform.forward = ball.ballRB.velocity.normalized;
            
            //print((ball.ballGO.transform.localRotation.y));

            


        }
    }

    private Vector3 GetTargetDirection(Vector3 currentForward)
    {
        // Calculate the current angle in degrees
        float currentAngle = Mathf.Atan2(currentForward.z, currentForward.x) * Mathf.Rad2Deg;

        // Normalize the angle to be between 0 and 360
        currentAngle = (currentAngle + 360) % 360;

        // Determine closest target angle: either 90 or 270 degrees
        float targetAngle = (Mathf.Abs(currentAngle - 90) < Mathf.Abs(currentAngle - 180)) ? 0 : 180;

        // Convert target angle back to radians for direction calculation
        float targetAngleRad = targetAngle * Mathf.Deg2Rad;

        // Return the target direction vector
        return new Vector3(Mathf.Cos(targetAngleRad), 0, Mathf.Sin(targetAngleRad));
    }

    public void BounceBall(GameObject ballGameObject, Vector3 collisionNormal)
    {
        Ball ball = IdentifyBall(ballGameObject);
        if (ball != null && Time.time - ball.lastBounceTime >= bounceCooldown)
        {
            Debug.DrawRay(ball.ballGO.transform.position, collisionNormal, Color.green, 10);
            // Reflect the ball's velocity over the collision normal
            Vector3 reflectedVelocity = Vector3.Reflect(ball.ballRB.velocity, collisionNormal);

            // Draw the reflected velocity for debugging
            Debug.DrawRay(ball.ballGO.transform.position, reflectedVelocity, Color.red, 10);
            print($"Bounce {reflectedVelocity}");

            // Apply the reflected velocity to the ball's Rigidbody
            ball.ballRB.velocity = reflectedVelocity;


            // Ensure the reflection doesn't exceed the maximum speed
            if (ball.ballRB.velocity.magnitude > maxSpeed)
            {
                ball.ballRB.velocity = ball.ballRB.velocity.normalized * maxSpeed;
            }

            ball.ballRB.AddForce(ball.ballRB.velocity.normalized * ball.ballSpeed, ForceMode.VelocityChange);
            ball.lastBounceTime = Time.time;


            ball.ballGO.transform.forward = ball.ballRB.velocity.normalized;
        }
    }

    private Ball IdentifyBall(GameObject ballGameObject)
    {
        if (ballGameObject == ballOne.ballGO)
            return ballOne;
        else if (ballGameObject == ballTwo.ballGO)
            return ballTwo;
        return null;
    }
}