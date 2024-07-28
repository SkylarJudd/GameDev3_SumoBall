using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnMathsSign : GameBehaviour
{
    [SerializeField] GameObject[] mathsSigns;
    [SerializeField] Transform mathsSignSpawnTransform;
    [SerializeField] GameObject currentSign;

    private void Start()
    {
        SpawnSign();
    }

    void SpawnSign()
    {
        if (currentSign != null)
            return;

        currentSign = Instantiate(mathsSigns[Random.Range(0, mathsSigns.Length)], mathsSignSpawnTransform.position, mathsSignSpawnTransform.rotation, gameObject.transform);
    }

    void DestroySign()
    {
        Destroy(currentSign);
    }

    public void PlayerEnter()
    {
        GivePlayerSign();
        print("PlayerPicked up sign");
    }

    void GivePlayerSign()
    {
        if(_BEEPC.mathsSignTransform.GetComponentInChildren<MathsPickupLogic>() == null)
        {
            currentSign.GetComponent<PickUpAnimate>().enabled = false;
            currentSign.transform.position = _BEEPC.mathsSignTransform.transform.position;
            currentSign.transform.SetParent(_BEEPC.mathsSignTransform);
            currentSign = null;
            Invoke("SpawnSign", Random.Range(10f, 30f));
        }
    }
}
