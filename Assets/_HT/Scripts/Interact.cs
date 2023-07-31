using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interact : MonoBehaviour {
    private Queue<GameObject> interactQueue = new Queue<GameObject>();

    public void InteractWith() {
        if (interactQueue.Count > 0) {
            GameObject obj = interactQueue.Peek(); // Get the first game object in the queue
            // Perform interaction with 'obj'
            Debug.Log("Interacting with: " + obj.name);
            if(obj.GetComponent<ChestInventory>() != null) {
                Debug.Log("OPENING CHEST");
                obj.GetComponent<ChestInventory>().OpenChest();
            }
            else if(obj.GetComponent<GunInventory>() != null) {
                Debug.Log("OPENING WEAPON ASSEMBLER");
                obj.GetComponent<GunInventory>().OpenWeaponTable();
            }
        }
    }

    private void OnTriggerEnter(Collider other) {
        // Check if the entering object is not already in the queue
        if (!interactQueue.Contains(other.gameObject)) {
            interactQueue.Enqueue(other.gameObject);
        }
    }

    private void OnTriggerExit(Collider other) {
        // Remove the exiting object from the queue
        if (interactQueue.Contains(other.gameObject)) {
            interactQueue.Dequeue();
        }
    }
}
