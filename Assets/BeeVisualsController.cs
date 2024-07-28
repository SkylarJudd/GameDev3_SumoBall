using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BeeVisualsController : MonoBehaviour
{
    [SerializeField] float beeSpeed;
    [SerializeField] float beeBlinkMin = 6;
    [SerializeField] float beeBlinkMax = 12;
    [SerializeField] Animator animator;


    private void Start()
    {
        animator = GetComponent<Animator>();
        StartCoroutine(BeeBlink(Random.Range(beeBlinkMin, beeBlinkMax)));
    }

    private void Update()
    {
       
    }

    public void UpdateBeeWingSpeed(float _Speed)
    {

        animator.SetFloat("Speed", _Speed);
       
    }

    IEnumerator BeeBlink(float _waitTime)
    {
        print("Blink Loop");
        yield return new WaitForSeconds(_waitTime);
        animator.SetInteger("BlinkRND", Random.Range(1, 5));
        animator.SetTrigger("Blink");
        StartCoroutine(BeeBlink(Random.Range(beeBlinkMin, beeBlinkMax)));
    }
}
