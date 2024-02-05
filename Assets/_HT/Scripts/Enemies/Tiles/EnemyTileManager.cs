using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Unity.AI.Navigation;
using Gamekit3D;

public class EnemyTileManager : MonoBehaviour {
    private TileUIManager tileUIManager;
    private NavMeshSurface spawnableSurface;

    public GameObject enemyPrefab;

    public int startingEnemiesOnTile;
    private int currentEnemiesOnTile;
    private int killedEnemies = 0;

    private void Start() {
        tileUIManager = GetComponent<TileUIManager>();
        spawnableSurface = GetComponent<NavMeshSurface>();
        SpawnInitialEnemies();
    }

    private void SpawnInitialEnemies() {
        for (int i = 0; i < startingEnemiesOnTile; i++) {
            // Randomly generate a position on the NavMesh
            Vector3 randomPosition = GetRandomPositionOnNavMesh(spawnableSurface.navMeshData);

            // Instantiate the enemyPrefab at the generated position
            GameObject enemy = Instantiate(enemyPrefab, randomPosition, Quaternion.identity);
            HookupEnemyToTile(enemy);
        }

        currentEnemiesOnTile = startingEnemiesOnTile;

        void HookupEnemyToTile(GameObject enemy) {
            enemy.GetComponent<EnemyController>().enemyTile = this;
        }
    }

    private Vector3 GetRandomPositionOnNavMesh(NavMeshData navMeshData) {
        Bounds bounds = navMeshData.sourceBounds;

        var x = Random.Range(bounds.min.x, bounds.max.x) + transform.position.x;
        var z = Random.Range(bounds.min.z, bounds.max.z) + transform.position.z;

        NavMeshHit hit;
        Vector3 randomPosition = new Vector3(x, 1+transform.position.y, z);

        if (NavMesh.SamplePosition(randomPosition, out hit, 1000f, NavMesh.AllAreas)) {
            randomPosition = hit.position;
        }

        return randomPosition;
    }


    // Method to handle enemy destruction
    public void HandleEnemyDestroyed() {
            currentEnemiesOnTile--;
            killedEnemies++;
        Debug.Log(currentEnemiesOnTile);
        Debug.Log((float)killedEnemies / currentEnemiesOnTile);
        tileUIManager.SetProgressBar((float)killedEnemies / startingEnemiesOnTile);
    }
}
