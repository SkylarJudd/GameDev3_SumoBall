using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ToggleTile : MonoBehaviour
{
    [SerializeField]
    private GameObject[] TileVisuals;
    [SerializeField]
    private PlayerNumber assingedPlayer;

    [SerializeField]
    private Animator animator;

    public void SetPlayer(PlayerNumber _assingedPlayer)
    {
        switch (_assingedPlayer)
        {
            case PlayerNumber.PlayerOne:
                // toggleVis(0);
                toggleVis("BlackToWhite");
                break;
            case PlayerNumber.PlayerTwo:
                //toggleVis(1);
                toggleVis("WhiteToBlack");
                break;
            case PlayerNumber.PlayerThree:
                //toggleVis(2);
                break;
            case PlayerNumber.PlayerFour:
                //toggleVis(3);
                break;
            default:
                break;

        }

        assingedPlayer = _assingedPlayer;
    }

    private void OnTriggerEnter(Collider other)
    {

        PongBall ball = other.GetComponent<PongBall>();
        if (ball == null) { print("No Ball"); return; }

        if (ball.playerNum != assingedPlayer)
        {
            SetPlayer(ball.playerNum);
            ball.Bounce();

        }
    }

    private void toggleVis(int index)
    {
        foreach (var item in TileVisuals)
        {
            item.SetActive(false);
        }
        TileVisuals[index].SetActive(true);
    }

    private void toggleVis(string transition)
    {
        animator.SetTrigger(transition);
    }
}
