using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Gamekit3D;

public class PlayerInTileManager : MonoBehaviour {
    public Transform player;
    public TileUIManager tileCurrentlyIn;

    // Update is called once per frame
    void Update() {
        CheckTileChange();

        // Check for left mouse button click
        if (Input.GetMouseButtonDown(0)) {
            float interactDistance = 7f;

            RaycastHit hit;

            // Use Camera.main for simplicity. Ensure that your camera is tagged as "MainCamera".
            if (Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hit, interactDistance)) {
                // Check if the hit object has a Damageable component
                Damageable damageable = hit.collider.gameObject.GetComponent<Damageable>();

                if (damageable != null) {
                    // Apply damage to the hit object
                    Damageable.DamageMessage enemyDamage = new Damageable.DamageMessage();
                    enemyDamage.amount = 3;
                    damageable.ApplyDamage(enemyDamage);
                }
            }
        }
    }

    private void CheckTileChange() {
        RaycastHit hit;
        float interactDistance = 6f;

        if (Physics.Raycast(player.position, Vector3.down, out hit, interactDistance)) {
            // Check if the hit object has a TileUIManager component
            TileUIManager tileUIManager = hit.collider.gameObject.GetComponent<TileUIManager>();

            if (tileUIManager != null) {
                // Check if it's the same as the one currently in
                if (tileUIManager != tileCurrentlyIn) {
                    if(tileCurrentlyIn != null) {
                        tileCurrentlyIn.ExitTile();
                    }
                    tileCurrentlyIn = tileUIManager;
                    tileCurrentlyIn.EnterTile();
                }
            }
        }
    }
}
