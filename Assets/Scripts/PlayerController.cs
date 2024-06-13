using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] float speed = 5.0f;
    [SerializeField] string focalPointName = "Focal Point";
    [SerializeField] string powerUpTag = "PowerUp";
    [SerializeField] string enemyTag = "Enemy";
    [SerializeField] GameObject powerUpIdicator;

    [SerializeField] bool hasPowerUp = false;

    private float _knockbackStrength = 2;

    private Rigidbody _playerRB;
    private GameObject _focalPoint;

    private float _powerUp_knockbackStrength = 15;

    private Vector3 _powerupOffSet = new Vector3(0, -0.5f, 0);
    private float _powerUpRotationSpeed = 20f;

    private Coroutine _pickupCoroutine;


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

        if ( hasPowerUp)
        {
            powerUpIdicator.transform.position = transform.position + _powerupOffSet;
            powerUpIdicator.transform.Rotate(Vector3.up , _powerUpRotationSpeed * Time.deltaTime);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(powerUpTag))
        {
            hasPowerUp = true;

            powerUpIdicator.SetActive(true);

            Transform _parentTransform = other.gameObject.transform.parent;
            Destroy(_parentTransform.gameObject);

            if (_pickupCoroutine != null)
            {
                StopCoroutine(_pickupCoroutine);
            }
            _pickupCoroutine = StartCoroutine(PowerupCountDownRoutine());
        }
    }

    IEnumerator  PowerupCountDownRoutine()
    {
        yield return new WaitForSeconds(7);
        hasPowerUp = false;
        powerUpIdicator.SetActive(false);
        StopCoroutine(_pickupCoroutine);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag(enemyTag) && hasPowerUp)
        {
            addknockBacktoEnermy(collision.gameObject, _powerUp_knockbackStrength);
        }
        else if (collision.gameObject.CompareTag(enemyTag) && !hasPowerUp)
        {
            addknockBacktoEnermy(collision.gameObject, _knockbackStrength);
        }

    }

    private void addknockBacktoEnermy(GameObject enermyGameObject , float force)
    {
        Rigidbody _enermyRigidbody = enermyGameObject.GetComponent<Rigidbody>();
        Vector3 _awayFromPlayer = enermyGameObject.transform.position - transform.position;

        _enermyRigidbody.AddForce(_awayFromPlayer * force, ForceMode.Impulse);


    }
}
