using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoalScript : MonoBehaviour
{
    [SerializeField] ParticleSystem particleSystem;
    [SerializeField] private string enemyTag = "Enemy";
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == enemyTag)
        {
            print("Goal");
            particleSystem.Play();
        }
    }
}
