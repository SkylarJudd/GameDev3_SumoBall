using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum MathsSign { Plus, Minis, Devide, Times }

public class MathsPickupLogic : MonoBehaviour
{
    public MathsSign mathsSign;
    public Rigidbody mathsSingRB;
    public bool pickedUp;

    private void Start()
    {
        mathsSingRB = GetComponent<Rigidbody>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && !pickedUp)
        {
            pickedUp = true;
            SpawnMathsSign spawnMathsSign = GetComponentInParent<SpawnMathsSign>();
            spawnMathsSign.PlayerEnter();
        }
    }

    public void DropSign()
    {
        gameObject.transform.parent = null;
        mathsSingRB.isKinematic = false;
        mathsSingRB.useGravity = true;
        Invoke("DestroySign", Random.Range(10, 20));
    }

    public void DestroySign()
    {
        Destroy(gameObject);
    }

    private void GameEvents_OnPlayerDeliverSignAccepted(GameObject obj)
    {
        if(obj == this.gameObject)
        {
            DestroySign();
        }
        
    }

    private void Awake()
    {
        GameEvents.OnPlayerDeliverSignAccepted += GameEvents_OnPlayerDeliverSignAccepted;
    }

    private void OnDestroy()
    {
        GameEvents.OnPlayerDeliverSignAccepted -= GameEvents_OnPlayerDeliverSignAccepted;
    }
}
