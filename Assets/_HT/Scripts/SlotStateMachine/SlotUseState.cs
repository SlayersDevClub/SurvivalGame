using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public class SlotUseState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        try {
            IUsable itemWithUse = GetEquipGameObject(item).GetComponent<IUsable>();

            //Pass the input to the prefabs script
            if (context.started) {
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
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
    }
}

