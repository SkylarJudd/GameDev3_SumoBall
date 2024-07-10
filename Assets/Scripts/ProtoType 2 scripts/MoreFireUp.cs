using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;

public class MoreFireUp : MonoBehaviour
{
    [SerializeField] KoalaPlayerController player;
    [SerializeField] SceneController sceneController;
    [SerializeField] float moveSpeed = 2;
    [SerializeField] GameObject deathText;

    [SerializeField] int health = 1000;
    //[SerializeField] List<tag> tags = new List<string>();

    private void Update()
    {
        if (player.tutorialDone == true)
        {
            Vector3 newPosition = gameObject.transform.position;
            newPosition.y += moveSpeed * Time.deltaTime;
            gameObject.transform.position = newPosition;
        }
    }

    private void Start()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            deathText.SetActive(true);
            Invoke("endgame", 3);
            Rigidbody playerRB = player.GetComponent<Rigidbody>();
            playerRB.useGravity = true;
            playerRB.isKinematic = false;
        }
    }
}
