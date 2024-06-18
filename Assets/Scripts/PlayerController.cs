using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] float speed = 5.0f;
    [SerializeField] string focalPointName = "Focal Point";
    [SerializeField] string powerUpTag = "PowerUp";
    [SerializeField] string powerUpTagTwo = "PowerUp2";
    [SerializeField] string enemyTag = "Enemy";
    [SerializeField] GameObject[] powerUpIdicator;


    [SerializeField] bool hasPowerUp = false;
    [SerializeField] bool hasPowerUpTwo = false;


    [SerializeField] float explosionForce = 1000f; // The force of the explosion
    [SerializeField] float explosionRadius = 5f; // The radius of the explosion
    [SerializeField] float upwardsModifier = 1f; // The upwards modifier for the explosion force

    private float _knockbackStrength = 2;

    private Rigidbody _playerRB;
    private GameObject _focalPoint;

    private float _powerUp_knockbackStrength = 15;

    private Vector3 _powerupOffSet = new Vector3(0, -0.5f, 0);
    private Vector3 _powerupTwoOffSet = new Vector3(0, 1.5f, 0);
    private float _powerUpRotationSpeed = 20f;

    private Coroutine _knockBackPickupCoroutine;
    private Coroutine _groundPoundPickupCoroutine;





    private Vector3 explosionPosition; // The position of the explosion


    void Start()
    {
        _playerRB = GetComponent<Rigidbody>();
        _focalPoint = GameObject.Find(focalPointName);
    }

    // Update is called once per frame
    void Update()
    {
        float forwardInput = Input.GetAxis("Vertical");
        _playerRB.AddForce(_focalPoint.transform.forward * forwardInput * (speed * 100) * Time.deltaTime);

        if (hasPowerUp)
        {
            powerUpIdicator[0].transform.position = transform.position + _powerupOffSet;
            powerUpIdicator[0].transform.Rotate(Vector3.up, _powerUpRotationSpeed * Time.deltaTime);
        }
        if (hasPowerUpTwo)
        {
            powerUpIdicator[1].transform.position = transform.position + _powerupTwoOffSet;
            powerUpIdicator[1].transform.Rotate(Vector3.up, _powerUpRotationSpeed * Time.deltaTime);
        }

        if (transform.position.y < GameMannager.GM_Instance.killHight)
        {
            PlayerReset();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(powerUpTag))
        {
            hasPowerUp = true;

            powerUpIdicator[0].SetActive(true);


            Transform _parentTransform = other.gameObject.transform.parent;
            Destroy(_parentTransform.gameObject);

            if (_knockBackPickupCoroutine != null)
            {
                StopCoroutine(_knockBackPickupCoroutine);
            }
            _knockBackPickupCoroutine = StartCoroutine(KnockBackPowerUpCountDown());
        }
        else if (other.CompareTag(powerUpTagTwo))
        {

            Transform _parentTransform = other.gameObject.transform.parent;
            Destroy(_parentTransform.gameObject);

            powerUpIdicator[1].SetActive(true);
            hasPowerUpTwo = true;

            if (_groundPoundPickupCoroutine != null)
            {
                StopCoroutine(_groundPoundPickupCoroutine);
            }

            _groundPoundPickupCoroutine = StartCoroutine(GroundPoundCoolDown());
        }
    }

    IEnumerator GroundPoundCoolDown()
    {
        print("Player picked up ground poound");
        _playerRB.useGravity = false;
        _playerRB.AddForce(Vector3.up * 20f, ForceMode.Impulse);

        yield return new WaitForSeconds(3);
        powerUpIdicator[1].SetActive(false);
        hasPowerUpTwo = true;
        _playerRB.useGravity = true;
        _playerRB.AddForce(Vector3.down * 100f, ForceMode.Impulse);

        yield return new WaitForSeconds(0.2f);
        ApplyExplosionForce();


    }

    IEnumerator KnockBackPowerUpCountDown()
    {
        yield return new WaitForSeconds(7);
        hasPowerUp = false;
        powerUpIdicator[0].SetActive(false);
        StopCoroutine(_knockBackPickupCoroutine);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag(enemyTag) && hasPowerUp)
        {
            addknockBacktoEnermy(collision.gameObject, _powerUp_knockbackStrength);
        }
        else if (collision.gameObject.CompareTag(enemyTag) && !hasPowerUp)
        {
            addknockBacktoEnermy(collision.gameObject, _knockbackStrength);
        }

    }

    private void addknockBacktoEnermy(GameObject enermyGameObject, float force)
    {
        Rigidbody _enermyRigidbody = enermyGameObject.GetComponent<Rigidbody>();
        Vector3 _awayFromPlayer = enermyGameObject.transform.position - transform.position;

        _enermyRigidbody.AddForce(_awayFromPlayer * force, ForceMode.Impulse);


    }

    void ApplyExplosionForce()
    {
        // Find all colliders within the explosion radius
        Collider[] colliders = Physics.OverlapSphere(explosionPosition, explosionRadius);

        // Loop through each collider
        foreach (Collider hit in colliders)
        {
            // Check if the object has the tag "Enemy"
            if (hit.CompareTag(enemyTag))
            {
                // Get the Rigidbody component
                Rigidbody rb = hit.GetComponent<Rigidbody>();

                // If the object has a Rigidbody, apply the explosion force
                if (rb != null)
                {
                    rb.AddExplosionForce(explosionForce, gameObject.transform.position, explosionRadius, upwardsModifier, ForceMode.Impulse);
                }
            }
        }
    }

    private void PlayerReset()
    {
        GameMannager.GM_Instance.PlayerDoADie();
        gameObject.transform.position = new Vector3(0, 1, 0);
    }
}
