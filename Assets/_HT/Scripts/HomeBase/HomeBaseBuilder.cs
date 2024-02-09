using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HomeBaseBuilder : MonoBehaviour
{
    public SnapGridCenter snapGridCenter;
    public GridVariable buildingGrid;
    public EnemySpawner enemySpawner;

    private void OnEnable() {
        buildingGrid.Value = GetComponent<Grid>();

        for(int i = 0; i < 10; i++) {
            enemySpawner.SpawnEnemy();
        }
    }
}
