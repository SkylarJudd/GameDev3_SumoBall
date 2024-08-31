using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseController : MonoBehaviour
{
    public GameObject pausePanal;
    bool paused = false;

    private void Start()
    {
        paused = false;
        pausePanal.SetActive(paused);
        Time.timeScale = 1.0f;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Pause();
        }
    }

    public void Pause()
    {
        print("Toggle Pause");
        paused = !paused;
        pausePanal.SetActive(paused);
        // if true then do this or that
        Time.timeScale = !paused ? 1.0f : 0.0f;

        Cursor.lockState = !paused ? CursorLockMode.Locked: CursorLockMode.None;
        Cursor.visible = !paused ?  false : true;

    }

}
