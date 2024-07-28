using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Windows;

public class BeePlayerController : Singleton<BeePlayerController>
{
    [Header("Base")]
    [SerializeField] BeeVisualsController visualsController;
    [SerializeField] GameObject playerController;
    Rigidbody beeRigidbody;
    Collider beeCollider;

    [Header("Movement")]
    [SerializeField] float beePower;
    [SerializeField] float beeLift = 0.0075f;
    [SerializeField] float effectiveHigh;

    bool _throttle = false;
    float _throttleValue = 0;

    private Vector2 _movement = Vector2.zero;

    [Header("Movement Forces")]
    [SerializeField] float forwardForce;
    [SerializeField] float backwardsForce;
    [SerializeField] float turnForce;

    float turnForceHelper = 0.5f;
    float turning = 0f;

    [Header("Tilt")]
    [SerializeField] float forwardTiltForce;
    [SerializeField] float turningTiltForce;

    private Vector2 _tilt = Vector2.zero;

    [Header("GroundCheck")]
    [SerializeField] LayerMask groundLayer;
    [SerializeField] float groundedDistance;
    [SerializeField] bool isGrounded;

    float distanceToGround;

    [Header("Maths Sign")]
    public Transform mathsSignTransform;

    void Start()
    {
        beeRigidbody = playerController.GetComponent<Rigidbody>();
        beeCollider = playerController.GetComponent<Collider>();
    }

    public void Update()
    {
        updateThrottle();
        HandleGroundCheck();
    }

    public void updateThrottle()
    {
        if (_throttle)
        {
            beePower += beeLift;
        }
        if (!_throttle)
        {
            if (beePower > 0)
                beePower -= beeLift;
            else
                beePower = 0;
        }
    }

    private void HandleGroundCheck()
    {
        RaycastHit hit;
        Vector3 direction = playerController.transform.TransformDirection(Vector3.down);
        Ray ray = new Ray(playerController.transform.position, direction);

        if (Physics.Raycast(ray, out hit, 3000, groundLayer))
        {
            distanceToGround = hit.distance;

            isGrounded = distanceToGround < groundedDistance ? true : false;
        }

    }

    public void Throttle(InputAction.CallbackContext _context)
    {
        if (_context.ReadValue<float>() > 0)
        {

            _throttle = true;
            _throttleValue = _context.ReadValue<float>();
            visualsController.UpdateBeeWingSpeed(1);
        }
        if (_context.ReadValue<float>() == 0)
        {

            _throttle = false;
            visualsController.UpdateBeeWingSpeed(0);
        }
    }

    public void Move(InputAction.CallbackContext _context)
    {
        _movement = _context.ReadValue<Vector2>();
    }

    protected void FixedUpdate()
    {
        BeeHover();
        BeeMove();
        BeeTilt();
    }

    void BeeHover()
    {
        float upForce = 1 - Mathf.Clamp(beeRigidbody.transform.position.y / effectiveHigh, 0, 1);
        upForce = Mathf.Lerp(0, beePower, upForce) * beeRigidbody.mass;
        beeRigidbody.AddRelativeForce(Vector3.up * upForce);
    }

    void BeeMove()
    {
        if (isGrounded)
            return;

        if (_movement.y > 0)
        {
            beeRigidbody.AddRelativeForce(Vector3.forward * Mathf.Max(0f, _movement.y * forwardForce * beeRigidbody.mass));
        }
        else if (_movement.y < 0)
        {
            beeRigidbody.AddRelativeForce(Vector3.back * Mathf.Max(0f, -_movement.y * backwardsForce * beeRigidbody.mass));
        }

        if (_movement.x != 0)
        {
            float _turn = turnForce * Mathf.Lerp(_movement.x, _movement.x * (turnForceHelper - Mathf.Abs(_movement.y)), Mathf.Max(0f, _movement.y));
            turning = Mathf.Lerp(turning, _turn, Time.fixedDeltaTime * turnForce);
        }
        else
        {
            turning = Mathf.Lerp(turning, 0, Time.fixedDeltaTime * turnForce);
        }

        beeRigidbody.AddRelativeTorque(0f, turning * beeRigidbody.mass, 0f);
    }

    void BeeTilt()
    {
        _tilt.y = Mathf.Lerp(_tilt.y, _movement.y * forwardTiltForce, Time.fixedDeltaTime);
        _tilt.x = Mathf.Lerp(_tilt.x, _movement.x * turningTiltForce, Time.fixedDeltaTime);
        beeRigidbody.transform.localRotation = Quaternion.Euler(_tilt.y, beeRigidbody.transform.localEulerAngles.y, -_tilt.x);
    }

    public void DropItem(InputAction.CallbackContext _context)
    {
        if (_context.ReadValue<float>() == 1)
        {
            print("DropItem");

            MathsPickupLogic mathsPickUp = mathsSignTransform.GetComponentInChildren<MathsPickupLogic>();
            if (mathsPickUp != null)
            {
                mathsPickUp.DropSign();
            }

        }
    }
}
