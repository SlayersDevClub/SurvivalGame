using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;


public class SlotEquipState : SlotBaseState {

    BaseItemTemplate equipItem;
    public override void EnterState(SlotStateMachine item) {
        if (GameObject.Find("Resource").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Resource").transform.GetChild(0).gameObject);
        } else if (GameObject.Find("Gun").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Gun").transform.GetChild(0).gameObject);
        } else if (GameObject.Find("Tool").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Tool").transform.GetChild(0).gameObject);
        }

        equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.transform.GetComponent<Slot>().id].Id);

     
        item.player.equipItemSlot = item.transform.GetComponent<Slot>().id;
        item.player.equipItem = equipItem;
        
        //ADD PLAYER ITEM HERE SO WHEN USING IS CALLED IT FIRES WEAPON OR KNOW WHAT TYPE OF WEAPON IT IS    player.equip

        ResourceTemplate resource = equipItem as ResourceTemplate;
        GunTemplate gun = equipItem as GunTemplate;
        ToolTemplate tool = equipItem as ToolTemplate;

        if (resource != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Resource").transform);
        } else if (gun != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Gun").transform);
        } else if (tool != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Tool").transform);
        }

    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        if (context.started) {

            if(context.action.name == TagManager.USE_ACTION) {
                item.SwitchState(item.UseState);
            }
            else if(context.action.name == TagManager.DROP_ACTION) {
                item.SwitchState(item.DropState);
            }

        }
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
       
    }

}
