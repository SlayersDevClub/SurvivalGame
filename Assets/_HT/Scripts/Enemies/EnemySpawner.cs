using UnityEngine;
using UnityEngine.AI;

[CreateAssetMenu(menuName = "Enemy/EnemySpawner")]
public class EnemySpawner : ScriptableObject {
    public GameObject enemyToSpawn;
    public float maxDistanceFromCenter = 30f; // Maximum distance from the center to spawn the enemy.

    private void Awake() {
        Debug.Log("ENEMY SPAWNER AWAKE");
        SpawnEnemy();
    }
    public void SpawnEnemy() {
        // Generate a random position on the NavMesh within the specified radius.
        Vector3 spawnPosition = FindRandomPositionOnNavMesh();

        // Instantiate the enemy at the spawn position.
        if (spawnPosition != Vector3.zero) {
            Instantiate(enemyToSpawn, spawnPosition, Quaternion.identity);
        } else {
            Debug.LogWarning("Unable to find a valid spawn position on the NavMesh.");
        }
    }

    private Vector3 FindRandomPositionOnNavMesh() {
        Vector3 randomPosition = Vector3.zero;

        for (int i = 0; i < 30; i++) // Try 30 times to find a valid position.
        {
            // Generate a random point within a circle.
            Vector2 randomCirclePoint = Random.insideUnitCircle.normalized * maxDistanceFromCenter;

            // Calculate the position.
            randomPosition = new Vector3(randomCirclePoint.x, 0f, randomCirclePoint.y);

            // Check if the position is on the NavMesh.
            NavMeshHit hit;
            if (NavMesh.SamplePosition(randomPosition, out hit, maxDistanceFromCenter, NavMesh.AllAreas)) {
                // Valid position found.
                return hit.position;
            }
        }

        // If no valid position is found after 30 attempts, return Vector3.zero.
        return Vector3.zero;
    }
}
