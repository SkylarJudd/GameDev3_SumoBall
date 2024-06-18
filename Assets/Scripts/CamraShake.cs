using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;
using Unity.VisualScripting;

public class CamraShake : MonoBehaviour
{
    private CinemachineVirtualCamera cam;
    private float shaketime = 0.2f;

    private float timer;
    private CinemachineBasicMultiChannelPerlin _cbmcp;

    private Coroutine resetTimerCoroutine;

    private void Awake()
    {
        cam = GetComponent<CinemachineVirtualCamera>();
    }

    private void Start()
    {
        StopShake();
    }
    public void ShakeCamera(float shakeIntencity = 1.0f)
    {
        CinemachineBasicMultiChannelPerlin _cbmcp = cam.GetCinemachineComponent<CinemachineBasicMultiChannelPerlin>();
        _cbmcp.m_AmplitudeGain = shakeIntencity;

        if (resetTimerCoroutine != null)
        {
            StopCoroutine(ResetTimer());
        }
        resetTimerCoroutine = StartCoroutine(ResetTimer());


    }

    IEnumerator ResetTimer()
    {
        print("Shacking");
        yield return new WaitForSeconds(shaketime);
        StopShake();
        StopCoroutine(ResetTimer());
    }

    private void StopShake()
    {
        CinemachineBasicMultiChannelPerlin _cbmcp = cam.GetCinemachineComponent<CinemachineBasicMultiChannelPerlin>();
        _cbmcp.m_AmplitudeGain = 0f;
        timer = 0;
    }

    
}
