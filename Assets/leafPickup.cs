using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeafPickup : MonoBehaviour
{
    private KoalaPlayerController player;

    private void Awake()
    {
        player = FindObjectOfType<KoalaPlayerController>();
        if (player == null)
        {
            Debug.LogError("KoalaPlayerController not found in the scene.");
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        print("Collision");
        if (other.CompareTag("Player"))
        {
            print("Colliderd with player");
            player.addtoDrunk(0.5f);
            player.addToEnergy(0.5f);
            Destroy(gameObject);
        }
    }
}
