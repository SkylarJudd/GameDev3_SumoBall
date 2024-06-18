using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System;

public class SpawnMannager : MonoBehaviour
{

    public static SpawnMannager SM_Instance { get; private set; }

    public event EventHandler OnEnemySpawn;

    public List<GameObject> enemies = new List<GameObject>();
    public List<GameObject> pickups = new List<GameObject>();


    [SerializeField] GameObject[] enemyPrefab;
    [SerializeField] GameObject[] powerup_KnockBackPrefab;

    [SerializeField] int enemyCount;

    [SerializeField] TMPro.TMP_Text levelText;



    private float _randomSpawnRange = 9;
    private int _powerUpsToSpawn = 1;


    private void Awake()
    {
        if (SM_Instance != null && SM_Instance != this)
        {
            Destroy(this);
        }
        else
        {
            SM_Instance = this;
        }
    }

    private void Start()
    {
        OnLevelChange();
    }

    private void Update()
    {
        
    }

    public void OnLevelChange()
    {
        
         if (GameMannager.GM_Instance != null)
         {
                GameMannager.GM_Instance.AddToWaveNumber(1);
                levelText.text = "CURRENT LEVEL: " + GameMannager.GM_Instance.GetWaveNumber().ToString();
                SpawnObjectRandom(GameMannager.GM_Instance.GetWaveNumber(), enemyPrefab);
                SpawnObjectRandom(_powerUpsToSpawn, powerup_KnockBackPrefab);
         }
         else
         {
                Debug.LogError("GameMannager Not Found");
         }
        
    }

    private void SpawnObjectRandom(int objectAmout, GameObject[] prefabToSpawn)
    {
        bool enemyEventSend;
        if (prefabToSpawn[0].gameObject.GetComponent<Enemy>() != null )
        {
            enemyEventSend = true;
        }
        else
        {
            enemyEventSend = false;
        }

        

        for (int i = 0; i < objectAmout; i++)
        {
            int index = UnityEngine.Random.Range(0, prefabToSpawn.Length);
            GameObject spawnedObject = Instantiate(prefabToSpawn[index], GenerateRandomSpawnPos(), prefabToSpawn[index].transform.rotation * Quaternion.Euler(0, UnityEngine.Random.Range(0, 360), 0));
            if (enemyEventSend && OnEnemySpawn != null)
            {
                enemies.Add(spawnedObject);
                print("EnemySpawnned Event Fired");
                OnEnemySpawn?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                pickups.Add(spawnedObject);
            }

        }
    }

    private Vector3 GenerateRandomSpawnPos()
    {
        float _spawnPositionX = UnityEngine.Random.Range(-_randomSpawnRange, _randomSpawnRange);
        float _spawnPositionZ = UnityEngine.Random.Range(-_randomSpawnRange, _randomSpawnRange);

        Vector3 _randomPos = new Vector3(_spawnPositionX, 0, _spawnPositionZ);

        return _randomPos;
    }

    private void OnDestroy()
    {
        SM_Instance = null;
    }
}
