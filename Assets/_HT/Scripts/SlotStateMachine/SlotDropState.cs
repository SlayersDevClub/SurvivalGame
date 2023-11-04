using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class SlotDropState : SlotBaseState
{
    public override void EnterState(SlotStateMachine item) {
        if (item.player.equipItem == null) {
            item.SwitchState(item.EquipState);
        }

        GameObject droppedItem = GetEquipGameObject(item);

        //if (item.player.equipItem is ResourceTemplate) {
        //    droppedItem = GameObject.Find("Resource").transform.GetChild(0).gameObject;
        //} else if (item.player.equipItem is ToolTemplate) {
        //    droppedItem = GameObject.Find("Tool").transform.GetChild(0).gameObject;
        //} else if (item.player.equipItem is GunTemplate) {
        //    droppedItem = GameObject.Find("Gun").transform.GetChild(0).gameObject;
        //}

        if (droppedItem != null) {
            droppedItem.GetComponentInParent<HandRigConnector>().ResetHands();
            droppedItem.transform.parent = null;

            Rigidbody rb;
            if (droppedItem.GetComponent<Rigidbody>())
                rb = droppedItem.GetComponent<Rigidbody>();
            else
            {
                rb = droppedItem.AddComponent<Rigidbody>();
                droppedItem.AddComponent<BoxCollider>();
            }

            rb.useGravity = true;
            rb.isKinematic = false;
            droppedItem.GetComponent<Collider>().enabled = true;

            Vector3 forceDirection = item.player.playerTransform.forward; // Adjust the force direction as needed
            float forceMagnitude = 5.0f; // Adjust the force magnitude as needed
            rb.AddForce(forceDirection.normalized * forceMagnitude, ForceMode.Impulse);

            foreach(Transform child in droppedItem.GetComponentsInChildren<Transform>())
                child.gameObject.layer = LayerMask.NameToLayer("Default");
        }

        item.player.inv.RemoveItem(item.player.equipItemSlot);
        item.player.equipItem = null;
        item.SwitchState(item.EquipState);
    }
    public override void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
    }
    public override void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
       
    }

}
