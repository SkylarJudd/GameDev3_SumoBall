using System;
using System.Collections;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Windows;


public class FishPongPlayerController : MonoBehaviour
{
    [Header("Input Actions")]
    

    [Header("Player Controllers")]
    [SerializeField]
    private GameObject player1;
    [SerializeField]
    private float player1MoveSpeed;
    [SerializeField]
    private float player1RotateSpeed;

    private Vector2 _input1;

    [SerializeField]
    private GameObject player2;
    [SerializeField]
    private float player2MoveSpeed;
    [SerializeField]
    private float player2RotateSpeed;

    private Vector2 _input2;

    [Header("PlayableArea")]
    [SerializeField]
    private float bounds = 5.0f;

    public void PlayerOneInput(InputAction.CallbackContext _context)
    {
        _input1 = _context.ReadValue<Vector2>();
       // Debug.Log($"PlayerOneInput: {_input1}");
    }

    public void PlayerTwoInput(InputAction.CallbackContext _context)
    {
        _input2 = _context.ReadValue<Vector2>();
        //Debug.Log($"PlayerOneInput: {_input2}");
    }

    private void Update()
    {
        MovePlayerOne();
        MovePlayeTwo();
    }

    private void MovePlayeTwo()
    {
        float _pos = player2.transform.position.z;
        if (_pos < bounds && _pos > -bounds)
        {
            Debug.Log($"Player 2 is withing the bounds: {_pos}");
            _pos += _input2.x * player2MoveSpeed * Time.deltaTime;
            Debug.Log($"Set P2 z to: {_pos}");
            player2.transform.position += new Vector3(0, 0, _pos);
        }
    }

    private void MovePlayerOne()
    {
        
        float _pos = player1.transform.position.z;
        if (_pos < bounds && _pos > -bounds)
        {
            Debug.Log($"Player 1 is withing the bounds: {_pos}");
            _pos += _input1.x * player1MoveSpeed * Time.deltaTime;
            Debug.Log($"Set P1 z to: {_pos}");
            player1.transform.position += new Vector3(0, 0, _pos);
        }
    }
}
