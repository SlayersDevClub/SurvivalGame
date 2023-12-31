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

    public override void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        if (context.action.name == TagManager.DROP_ACTION) {
            item.SwitchState(item.DropState);
        } else {
            item.SwitchState(item.UseState);
            item.StartHandleInput(context);
        }
    }

    public override void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
    }


}
