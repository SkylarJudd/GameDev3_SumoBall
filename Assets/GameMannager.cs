using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameMannager : MonoBehaviour
{

    public static GameMannager GM_Instance { get; private set; }

    

    private int waveNumber;
    private int enemyCount;



    private void Awake()
    {
        if (GM_Instance != null && GM_Instance != this)
        {
            Destroy(this);
        }
        else
        {
            GM_Instance = this;
        }
    }

    private void Start()
    {
        SpawnMannager.SM_Instance.OnEnemySpawn += SM_Instance_OnEnemySpawn;
    }

    private void SM_Instance_OnEnemySpawn(object sender, EventArgs e)
    {
        enemyCount++;
        print("EnermySpawned, EnemyCount = " + enemyCount);
    }

    public void EnemyDoADie()
    {
        enemyCount--;
    }

    private void OnDestroy()
    {
        GM_Instance = null;
    }

    public int GetWaveNumber()
    {
        return waveNumber;
    }

    public void AddToWaveNumber(int waveNumberAdd)
    {
        waveNumber = waveNumber + waveNumberAdd;
    }

    public void WaveNumberReset()
    {
        waveNumber = 1;
    }
}
