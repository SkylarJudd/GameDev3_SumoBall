using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class GameMannager : MonoBehaviour
{

    public static GameMannager GM_Instance { get; private set; }

    public float killHight = -10f;

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
        if (enemyCount == 0)
        {
            SpawnMannager.SM_Instance.OnLevelChange();
        }
    }

    public void PlayerDoADie()
    {

        //for (int i = 0; i <= SpawnMannager.SM_Instance.enemies.Count; i++)
        //{

        //    GameObject enemyOnject = SpawnMannager.SM_Instance.enemies[i];
        //    SpawnMannager.SM_Instance.enemies.Remove(enemyOnject);
        //    Destroy(enemyOnject);
        //}

        List<GameObject> enemiesToRemove = new List<GameObject>();

        foreach (GameObject enemyObject in SpawnMannager.SM_Instance.enemies)
        {
            enemiesToRemove.Add(enemyObject);
        }

        foreach (GameObject enemyObject in enemiesToRemove)
        {
            SpawnMannager.SM_Instance.enemies.Remove(enemyObject);
            Destroy(enemyObject);
        }

        waveNumber = 0;
        enemyCount = 0;
        SpawnMannager.SM_Instance.OnLevelChange();
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

   
}
