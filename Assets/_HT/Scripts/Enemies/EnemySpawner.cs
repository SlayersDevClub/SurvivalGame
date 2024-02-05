using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemySpawner : MonoBehaviour {
    public GameObject enemyToSpawn;
    public Transform player;
    public float maxDistanceFromPlayer = 100f; // Maximum distance from the player to spawn the enemy.

    private void Start() {
        if (player != null) {
            // Get the player's position.
            Vector3 playerPosition = player.position;

            // Generate a random position near the player within the specified radius.
            Vector3 spawnPosition = FindRandomPositionNearPlayer(playerPosition);

            // Instantiate the enemy at the spawn position.
            if (spawnPosition != Vector3.zero) {
                Instantiate(enemyToSpawn, spawnPosition, Quaternion.identity);
                

            } else {
                Debug.LogWarning("Unable to find a valid spawn position near the player.");
            }
        } else {
            Debug.LogError("Player transform not assigned. Make sure to assign the player's transform to the 'player' field.");
        }
    }

    private Vector3 FindRandomPositionNearPlayer(Vector3 playerPosition) {
        Vector3 randomPosition = Vector3.zero;

        for (int i = 0; i < 30; i++) // Try 30 times to find a valid position.
        {
            // Generate a random point within a circle around the player.
            Vector2 randomCirclePoint = Random.insideUnitCircle.normalized * maxDistanceFromPlayer;

            // Calculate the position.
            Vector3 randomOffset = new Vector3(randomCirclePoint.x, 0f, randomCirclePoint.y);
            randomPosition = playerPosition + randomOffset;

            // Check if the position is on the NavMesh.
            NavMeshHit hit;
            if (NavMesh.SamplePosition(randomPosition, out hit, maxDistanceFromPlayer, NavMesh.AllAreas)) {
                // Valid position found.
                return hit.position;
            }
        }

        // If no valid position is found after 30 attempts, return Vector3.zero.
        return Vector3.zero;
    }

}
