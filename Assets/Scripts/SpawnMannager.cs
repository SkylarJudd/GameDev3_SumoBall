using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnMannager : MonoBehaviour
{
    [SerializeField] GameObject enemyPrefab;
    [SerializeField] GameObject powerup_KnockBackPrefab;

    [SerializeField] int enemyCount;

    private float _randomSpawnRange = 9;
    private int _waveNumber = 1;
    private int _powerUpsToSpawn = 1;

    private void Start()
    {

        SpawnObjectRandom(_waveNumber, enemyPrefab);
        SpawnObjectRandom(_powerUpsToSpawn, powerup_KnockBackPrefab);

    }

    private void Update()
    {
        enemyCount = FindObjectsOfType<Enemy>().Length;

        if ( enemyCount == 0 )
        {
            _waveNumber++;
            SpawnObjectRandom(_waveNumber , enemyPrefab);
            SpawnObjectRandom(_powerUpsToSpawn, powerup_KnockBackPrefab);

        }
    }
    private void SpawnObjectRandom(int objectAmout, GameObject prefabToSpawn)
    {
        for (int i = 0; i < objectAmout; i++)
        {
            Instantiate(prefabToSpawn, GenerateRandomSpawnPos(), prefabToSpawn.transform.rotation);
        }
    }

    private Vector3 GenerateRandomSpawnPos()
    {
        float _spawnPositionX = Random.Range(-_randomSpawnRange, _randomSpawnRange);
        float _spawnPositionZ = Random.Range(-_randomSpawnRange, _randomSpawnRange);

        Vector3 _randomPos = new Vector3(_spawnPositionX, 0, _spawnPositionZ);

        return _randomPos;
    }    
}
