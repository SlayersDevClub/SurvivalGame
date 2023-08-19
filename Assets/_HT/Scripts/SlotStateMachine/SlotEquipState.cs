using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
using UnityEngine.UI;


public class SlotEquipState : SlotBaseState {

    BaseItemTemplate equipItem;
    public override void EnterState(SlotStateMachine item) {
        Debug.Log("SWITCHING TO EQUIP");

        equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.transform.GetComponent<Slot>().id].Id);
        Transform itemToEquip = item.transform;
        itemToEquip.GetComponent<Image>().color = Color.yellow;

        item.player.equipItemSlot = item.transform.GetComponent<Slot>().id;
        HandleIfEquipChanges(item);
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
        HandleDropAndSwap(item, pointerEventData, slotID, slot);

        HandleIfEquipChanges(item);
    }

}
