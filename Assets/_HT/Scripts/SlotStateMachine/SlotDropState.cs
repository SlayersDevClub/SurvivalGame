using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class SlotDropState : SlotBaseState
{
    public override void EnterState(SlotStateMachine item) {
        if (item.player.equipItem == null) {
            return;
        }

        item.player.inv.RemoveItem(item.player.equipItemSlot);

        if (item.player.equipItem as ResourceTemplate != null) {
            GameObject droppedResource = GameObject.Find("Resource").transform.GetChild(0).gameObject;
            droppedResource.transform.parent = null;

            Rigidbody rb = droppedResource.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedResource.AddComponent<Rigidbody>();
                droppedResource.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = item.player.playerTransform.forward; // Adjust the force direction as needed
            float forceMagnitude = 5.0f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);

        } else if (item.player.equipItem as ToolTemplate != null) {
            GameObject droppedTool = GameObject.Find("Tool").transform.GetChild(0).gameObject;
            droppedTool.transform.parent = null;

            Rigidbody rb = droppedTool.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedTool.AddComponent<Rigidbody>();
                droppedTool.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = item.player.playerTransform.forward; // Adjust the force direction as needed
            float forceMagnitude = 5f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);
        } else if (item.player.equipItem as GunTemplate != null) {
            GameObject droppedGun = GameObject.Find("Gun").transform.GetChild(0).gameObject;
            droppedGun.transform.parent = null;

            Rigidbody rb = droppedGun.GetComponent<Rigidbody>();
            if (rb == null) {
                rb = droppedGun.AddComponent<Rigidbody>();
                droppedGun.AddComponent<BoxCollider>();
            }

            Vector3 forceDirection = item.player.playerTransform.forward; // Adjust the force direction as needed
            float forceMagnitude = 5f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);
        }

        item.player.equipItem = null;

        item.SwitchState(item.EquipState);
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        
    }
}
