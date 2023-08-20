using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public class SlotUseState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Debug.Log("IN USE STATE");
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        try {
            IUsable itemWithUse = item.player.equipItem.prefab.GetComponent<IUsable>();

            //Pass the input to the prefabs script
            if (context.started) {
                Debug.Log("REACHED");
                itemWithUse.HandleInput(context);
            }
            if (context.canceled) {
                item.SwitchState(item.EquipState);
            }
        } catch {
            item.SwitchState(item.EquipState);
            
        }
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        Debug.Log("USIKNG ON DROP");
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
    }
}

