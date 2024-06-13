using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    [SerializeField] float speed = 3.0f;
    [SerializeField] string playerGameObjectName = "Player";

    private Rigidbody _enemyRB;
    private GameObject _player;

    private float killHight = -10f;

    private void Start()
    {
        _enemyRB = GetComponent<Rigidbody>();
        _player = GameObject.Find(playerGameObjectName);
    }

    private void Update()
    {
        Vector3 _lookdirection = (_player.transform.position - transform.position).normalized;
        _enemyRB.AddForce(_lookdirection * (speed * 100) * Time.deltaTime);

        if ( transform.position.y < killHight)
        {
            Destroy(gameObject);
        }

    }
}
