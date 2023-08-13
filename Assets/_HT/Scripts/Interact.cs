using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interact : MonoBehaviour {

    public void DropItem() {
        if(PlayerManager.equipItem == null) {
            return;
        }

        GameObject.Find("Inventory").GetComponent<Inventory>().RemoveItem(PlayerManager.equipSlot - 1);

        if(PlayerManager.equipItem as ResourceTemplate != null) {
            GameObject droppedResource = GameObject.Find("Resource").transform.GetChild(0).gameObject;
            droppedResource.transform.parent = null;

            Rigidbody rb = droppedResource.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedResource.AddComponent<Rigidbody>();
                droppedResource.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = PlayerManager.GetPlayerTransform().forward; // Adjust the force direction as needed
            float forceMagnitude = 5.0f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);

        } else if(PlayerManager.equipItem as ToolTemplate != null) {
            GameObject droppedTool = GameObject.Find("Tool").transform.GetChild(0).gameObject;
            droppedTool.transform.parent = null;

            Rigidbody rb = droppedTool.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedTool.AddComponent<Rigidbody>();
                droppedTool.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = PlayerManager.GetPlayerTransform().forward; // Adjust the force direction as needed
            float forceMagnitude = 5f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);
        } else if (PlayerManager.equipItem as GunTemplate != null) {
            GameObject droppedGun = GameObject.Find("Gun").transform.GetChild(0).gameObject;
            droppedGun.transform.parent = null;

            Rigidbody rb = droppedGun.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedGun.AddComponent<Rigidbody>();
                droppedGun.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = PlayerManager.GetPlayerTransform().forward; // Adjust the force direction as needed
            float forceMagnitude = 5f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);
        }

        PlayerManager.equipItem = null;
    }
}
