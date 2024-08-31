using DG.Tweening.Core.Easing;
using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PongBall : MonoBehaviour
{
    public PlayerNumber playerNum;
    public BallManager ballManager;

    public void Bounce()
    {
        ballManager.BounceBall(gameObject, true);
    }
    public void Bounce(Vector3 normal)
    {
        //print(normal);
        ballManager.BounceBall(gameObject, normal);
    }

}
