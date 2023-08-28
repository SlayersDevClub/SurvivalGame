using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class SpawnPlayers : MonoBehaviour
{
    public GameObject playerPrefab;

    private void Start() {
        Vector3 randomSpawnPosition = Vector3.zero;

        PhotonNetwork.Instantiate(playerPrefab.name, randomSpawnPosition, Quaternion.identity);
    }
}
