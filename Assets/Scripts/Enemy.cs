using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    [SerializeField] float speed = 3.0f;
    [SerializeField] string playerGameObjectName = "Player";
    [SerializeField] float chargeSpeed = 1000;

    [SerializeField] GameObject enermyVisuals;

    private Rigidbody _enemyRB;
    private GameObject _player;

    private float killHight = -10f;

    private Coroutine _chargecCoroutine;

    private bool chargeStarted = false;
    private bool chargeFinished = false;

    private Vector3 enermyTargetScale;

    private void Start()
    {
        _enemyRB = GetComponent<Rigidbody>();
        _player = GameObject.Find(playerGameObjectName);
    }

    private void Update()
    {
        if (!charging())
        {
            print("MovingFrom 1");
            MovePlayer(speed);
        }
        else if (charging() && !chargeStarted)
        {
            chargeStarted = true;
            chargeFinished = false;
            _chargecCoroutine = StartCoroutine(ChargeingEnermy());
        }
        else if (chargeFinished)
        {
            MovePlayer(speed);
            print("MovingFrom 2");
            lerpScale();
        }
        else if (charging() && chargeStarted)
        {
            lerpScale();
        }

        
    }

    private void lerpScale()
    {
        enermyVisuals.transform.localScale = Vector3.Lerp(enermyVisuals.transform.localScale, enermyTargetScale , Time.deltaTime);
    }

    private void MovePlayer(float speed)
    {
        Vector3 _lookdirection = (_player.transform.position - transform.position).normalized;
        _enemyRB.AddForce(_lookdirection * (speed * 100) * Time.deltaTime);

        if (transform.position.y < killHight)
        {
            Destroy();
        }
    }

    IEnumerator ChargeingEnermy()
    {
        _enemyRB.velocity = Vector3.zero;
        _enemyRB.angularVelocity = Vector3.zero;
        for (int i = 0; i < 5; i++)
        {

            enermyTargetScale = new Vector3(1, 1, 1) * ((i + 1) * 0.5f);
            yield return new WaitForSeconds(1);
            print("Charging!");

        }
        enermyTargetScale = new Vector3(1, 1, 1);
        print("Yeet");

        Vector3 _lookdirection = (_player.transform.position - transform.position).normalized;
        _enemyRB.AddForce(_lookdirection * (chargeSpeed * 100) * Time.deltaTime, ForceMode.Impulse);

        chargeFinished = true;

        float chargeCoolDown = 5.0f;
        yield return new WaitForSeconds(chargeCoolDown);

        chargeStarted = false;
    }

    public virtual bool charging()
    {
        return false;
    }

    private void Destroy()
    {
        Destroy(gameObject);
    }


}
