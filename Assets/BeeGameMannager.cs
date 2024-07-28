using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem.LowLevel;

public class BeeGameMannager : Singleton<BeeGameMannager>
{
    public int currentScore = 0;
    public int scoreToWin;
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public void UpdateScore()
    {
        currentScore++;

        if(currentScore == scoreToWin)
        {
            print("You Win");
        }
    }


}
