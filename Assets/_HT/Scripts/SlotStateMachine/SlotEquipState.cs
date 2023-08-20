using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
using UnityEngine.UI;


public class SlotEquipState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Transform itemToEquip = item.transform;
        itemToEquip.GetComponent<Image>().color = Color.yellow;

        item.player.equipItemSlot = item.transform.GetComponent<Slot>().id;
        
        HandleIfEquipChanges(item);
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
        if (context.started) {

            if(context.action.name == TagManager.DROP_ACTION) {
                item.SwitchState(item.DropState);
            } else {
                item.SwitchState(item.UseState);
                Debug.Log("FIRST REACH");
                item.HandleInput(context);
            }

        }
        
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        Debug.Log("HANDLING IN EQUIPSTATE");

        //HandleIfEquipChanges(item);
    }

}
