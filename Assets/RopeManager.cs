using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class RopePoint
{
    public GameObject pointGO;
    public BoxCollider pointBC;
    public Rigidbody pointRB;
    public CollisionHandler pointCH;
    public bool collided;    //This bool will be toggled when a ball collides with the point, so the rope correction dose not update it. 
    public float lastCollid;  //The Point will be locked for an amout of time, so it wont be updated by the rope correction
    public bool end;
}
[Serializable]
public class MeshPoint
{
    public Vector3 point;
}

public class RopeManager : MonoBehaviour
{
    [Header("Spawning Rope")]
    [SerializeField]
    [Tooltip("Number of points to spawn")]
    private int numberOfObjects = 10;
    [SerializeField]
    [Tooltip("Prefab of the object to spawn")]
    private GameObject objectPrefab;
    [SerializeField]
    [Tooltip("Y-axis spawn height for the objects")]
    private float ySpawnHeight = 0.5f;     

    [Header("Rope properties")]
    [SerializeField]
    [Tooltip("Maximum stretch amount between points")]
    private float stretchLimit = 1.0f;     
    [SerializeField]
    [Tooltip("The Time It takes after a collision for a rope to caculate its smoothoothing")]
    private float pointResetTime = 1.0f;
    [SerializeField]
    [Tooltip("Will mutiply the force applied to the rope to achive is disired position")]
    private float forceMultiplier;
    [SerializeField]
    [Tooltip("The amount the avarge will be times by to incese the infnfuwence of collided points")]
    private float collidedWeight = 0.5f;

    [SerializeField]
    [Tooltip("The amount the avarge will be times by to incese the infnfuwence of collided points")]
    private BoxCollider bounds ;


    [Header("Debug")]
    [SerializeField]
    private GameObject debugGO;

    [SerializeField]
    private List<RopePoint> ropePoints = new List<RopePoint>();  // List to store all spawned objects
    [SerializeField]
    private List<MeshPoint> meshPoints = new List<MeshPoint>(); //list to stroe all the points for the mesh. 

    void Start()
    {
        SpawnObjectsInLine();
        StartCoroutine(UpdateRope());
    }

    private void Update()
    {
       
    }

    IEnumerator UpdateRope()
    {
        while (true)
        {
            for (int i = 0; i < ropePoints.Count; i++)
            {
                if (ropePoints[i].collided && (Time.time - ropePoints[i].lastCollid > pointResetTime))
                {
                    ropePoints[i].collided = false;
                }
                else if (!ropePoints[i].collided)
                {
                    AdjustPoint(i);
                }
            }
            yield return new WaitForEndOfFrame();
        }
    }

    void SpawnObjectsInLine()
    {
        float minZ = -5.0f;
        float maxZ = 5.0f;
        float step = (maxZ - minZ) / (numberOfObjects - 1);

        for (int i = 0; i < numberOfObjects; i++)
        {
            float zPosition = minZ + step * i;
            RopePoint newRP = new RopePoint();
            newRP.pointGO = Instantiate(objectPrefab, new Vector3(0, ySpawnHeight, zPosition), Quaternion.identity, transform);
            SetupComponents(newRP);

            newRP.end = i == 0 || i == numberOfObjects - 1;

            ropePoints.Add(newRP);

            MeshPoint newMP = new MeshPoint();
            newMP.point = newRP.pointGO.transform.position;
            meshPoints.Add(newMP);
        }
    }

    void SetupComponents(RopePoint newRP)
    {
        Rigidbody rb = newRP.pointGO.GetComponent<Rigidbody>() ?? newRP.pointGO.AddComponent<Rigidbody>();
        rb.useGravity = false;
        rb.constraints = RigidbodyConstraints.FreezePositionY | RigidbodyConstraints.FreezePositionZ | RigidbodyConstraints.FreezeRotation;

        BoxCollider sc = newRP.pointGO.GetComponent<BoxCollider>() ?? newRP.pointGO.AddComponent<BoxCollider>();
        sc.isTrigger = true;

        CollisionHandler ch = newRP.pointGO.GetComponent<CollisionHandler>() ?? newRP.pointGO.AddComponent<CollisionHandler>();
        ch.Initialize(ropePoints.Count, this);

        newRP.pointRB = rb;
        newRP.pointBC = sc;
        newRP.pointCH = ch;
    }


    public void HandleCollision(int index, GameObject collidedObject)
    {
        PongBall ball = collidedObject.GetComponent<PongBall>();
        if (ball == null) return;

        ball.Bounce();
        (Vector2 direction, float force) = GetInfroFromPlayerNumber(ball.playerNum);
        ropePoints[index].collided = true;
        ropePoints[index].lastCollid = Time.time;

        if (direction != Vector2.zero)
        {
            ApplyForceToRopePoint(index, force, direction);
        }
    }



    bool AdjustPoint(int pointIndex)
    {
        Vector3 currentPosition = ropePoints[pointIndex].pointGO.transform.position;
        float average = CalculateExtendedAverage(pointIndex);
        Vector3 targetPosition = new Vector3(average, currentPosition.y, currentPosition.z);
        meshPoints[pointIndex].point = targetPosition;

        float distance = Vector3.Distance(currentPosition, targetPosition);
        if (distance > stretchLimit)
        {
            Vector3 forceDirection = (targetPosition - currentPosition).normalized;
            Vector3 predictedPosition = currentPosition + (forceDirection * distance * forceMultiplier);
            if (IsWithinBounds(predictedPosition))
            {
                ropePoints[pointIndex].pointRB.AddForce(forceDirection * distance * forceMultiplier, ForceMode.Impulse);
            }
            else
            {
                ClampPointWithinBounds(ropePoints[pointIndex]);
            }
            return true;
        }
        return false;
    }

    private bool IsWithinBounds(Vector3 position)
    {
        return bounds.bounds.Contains(position);
    }

    private void ClampPointWithinBounds(RopePoint point)
    {
        Vector3 clampedPosition = point.pointGO.transform.position;
        clampedPosition.x = Mathf.Clamp(clampedPosition.x, bounds.bounds.min.x, bounds.bounds.max.x);
        clampedPosition.z = Mathf.Clamp(clampedPosition.z, bounds.bounds.min.z, bounds.bounds.max.z);
        point.pointGO.transform.position = clampedPosition;
    }

    private float CalculateExtendedAverage(int pointIndex)
    {
        int numPoints = 0;
        float sum = 0f;
        int neighborRange = 4;

        for (int i = pointIndex - neighborRange; i <= pointIndex + neighborRange; i++)
        {
            if (i >= 0 && i < ropePoints.Count)
            {
                float weightedPosition = ropePoints[i].pointGO.transform.position.x;
                if (ropePoints[i].collided)
                {
                    weightedPosition *= collidedWeight;
                }
                sum += weightedPosition;
                numPoints++;
            }
        }
        return numPoints > 0 ? sum / numPoints : ropePoints[pointIndex].pointGO.transform.position.x;
    }

    void ApplyForceToRopePoint(int index, float power, Vector2 direction)
    {
        Vector3 forceVector = new Vector3(direction.x * power, 0, direction.y * power);
        Vector3 predictedPosition = ropePoints[index].pointGO.transform.position + forceVector;

        if (IsWithinBounds(predictedPosition))
        {
            ropePoints[index].pointRB.AddForce(forceVector, ForceMode.Impulse);
        }
        else
        {
            ClampPointWithinBounds(ropePoints[index]);
        }
    }

    (Vector2, float) GetInfroFromPlayerNumber(PlayerNumber playerNumber)
    {
        switch (playerNumber)
        {
            case PlayerNumber.PlayerOne: return (new Vector2(-1, 0), 1);
            case PlayerNumber.PlayerTwo: return (new Vector2(1, 0), 1);
            default: return (Vector2.zero, 1);
        }
    }
}