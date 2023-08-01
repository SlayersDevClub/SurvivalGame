using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interact : MonoBehaviour {
    private Queue<GameObject> interactQueue = new Queue<GameObject>();

    private GameObject curObjectInteracting;
    public void InteractWith() {
        if (interactQueue.Count > 0) {
            GameObject obj = interactQueue.Peek(); // Get the first game object in the queue
            // Perform interaction with 'obj'
            if(obj.GetComponent<ChestInventory>() != null) {
                GetComponentInParent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Interacting);
                obj.GetComponent<ChestInventory>().OpenChest();
                curObjectInteracting = obj;
            }
            else if(obj.GetComponent<GunInventory>() != null) {
                GetComponentInParent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Interacting);
                obj.GetComponent<GunInventory>().OpenWeaponTable();
                curObjectInteracting = obj;
            }
            else if(obj.GetComponent<CraftingInventory>() != null) {
                GetComponentInParent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Interacting);
                obj.GetComponent<CraftingInventory>().OpenCraftingTable();
                curObjectInteracting = obj;
            }
        }
    }

    public void StopInteractWith() {
        if (curObjectInteracting.GetComponent<ChestInventory>() != null) {
            curObjectInteracting.GetComponent<ChestInventory>().CloseChest();

        } else if (curObjectInteracting.GetComponent<GunInventory>() != null) {
            curObjectInteracting.GetComponent<GunInventory>().CloseWeaponTable();

        } else if (curObjectInteracting.GetComponent<CraftingInventory>() != null) {
            curObjectInteracting.GetComponent<CraftingInventory>().CloseCraftingTable();
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
