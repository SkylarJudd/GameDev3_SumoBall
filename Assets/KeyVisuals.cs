using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.UI;

public class KeyVisuals : MonoBehaviour
{
    [SerializeField] KoalaPlayerController player;
    [SerializeField] GameObject controls;
    [SerializeField] GameObject drunkText;
    [SerializeField] GameObject fireText;

    [SerializeField] Image[] keyImages;

    [SerializeField] Sprite[] keyDefultSprites;
    [SerializeField] Sprite[] keySelectedSprites;
    [SerializeField] Sprite[] keyDownSprites;

    [SerializeField] Sprite[] spriteArray;



    private void Update()
    {

    }

    private void LateUpdate()
    {
        if (Input.GetKeyDown(KeyCode.W))
        {
            UpdateSpritedown(0);
        }
        else if (Input.GetKeyDown(KeyCode.A))
        {
            UpdateSpritedown(1);
        }
        else if (Input.GetKeyDown(KeyCode.S))
        {
            UpdateSpritedown(2);
        }
        else if (Input.GetKeyDown(KeyCode.D))
        {
            UpdateSpritedown(3);
        }
        else if (Input.GetKeyDown(KeyCode.UpArrow))
        {
            UpdateSpritedown(4);
        }
        else if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            UpdateSpritedown(5);
        }
        else if (Input.GetKeyDown(KeyCode.DownArrow))
        {
            UpdateSpritedown(6);
        }
        else if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            UpdateSpritedown(7);
        }
        else if (Input.GetKeyDown(KeyCode.Space))
        {
            UpdateSpritedown(8);
            for (int i = 0; i < keyImages.Length - 1; i++)
            {
                UpdateSpriteUp(i);
            }
        }

        if (Input.GetKeyUp(KeyCode.W))
        {
            UpdateSpriteUp(0);
        }
        else if (Input.GetKeyUp(KeyCode.A))
        {
            UpdateSpriteUp(1);
        }
        else if (Input.GetKeyUp(KeyCode.S))
        {
            UpdateSpriteUp(2);
        }
        else if (Input.GetKeyUp(KeyCode.D))
        {
            UpdateSpriteUp(3);
        }
        else if (Input.GetKeyUp(KeyCode.UpArrow))
        {
            UpdateSpriteUp(4);
        }
        else if (Input.GetKeyUp(KeyCode.LeftArrow))
        {
            UpdateSpriteUp(5);
        }
        else if (Input.GetKeyUp(KeyCode.DownArrow))
        {
            UpdateSpriteUp(6);
        }
        else if (Input.GetKeyUp(KeyCode.RightArrow))
        {
            UpdateSpriteUp(7);
        }
        else if (Input.GetKeyUp(KeyCode.Space))
        {
            UpdateSpriteUp(8);
        }
    }

    private void UpdateSpritedown(int index)
    {
        keyImages[index].sprite = keyDownSprites[index];
    }

    private void UpdateSpriteUp(int index)
    {
        if (player.toggleHands == false && index < 4)
        {
            spriteArray = keyDefultSprites;
        }
        else if (player.toggleHands == true && index > 3)
        {
            spriteArray = keyDefultSprites;
        }
        else if (player.toggleHands == true && index < 4)
        {
            spriteArray = keySelectedSprites;
        }
        else if (player.toggleHands == false && index > 3)
        {
            spriteArray = keySelectedSprites;
        }

        keyImages[index].sprite = spriteArray[index];

    }

    public void turnOffControls()
    {
        controls.SetActive(false);
        drunkText.SetActive(true);
        Invoke("turnOffdrunk", 5f);
    }

    public void turnOffdrunk()
    {

        drunkText.SetActive(false);
        fireText.SetActive(true);
        Invoke("turnOffFire", 5f);
    }

    public void turnOffFire()
    {
        fireText.SetActive(false);
    }
}
