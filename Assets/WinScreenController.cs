using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting.Antlr3.Runtime;
using UnityEngine;

public class WinScreenController : MonoBehaviour
{
    public GameObject winscreen;
    private void OnEnable()
    {
        GameEvents.OnPlayerWin += GameEvents_OnPlayerWin;
    }

    private void GameEvents_OnPlayerWin(GameObject obj)
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        winscreen.SetActive(true);
        Time.timeScale = 0.0f;
    }

    private void OnDisable()
    {
        GameEvents.OnPlayerWin -= GameEvents_OnPlayerWin;
    }
}
