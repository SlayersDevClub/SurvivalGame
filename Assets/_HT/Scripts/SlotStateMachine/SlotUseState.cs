using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public class SlotUseState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
    }
    public override void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        try {
            IUsable itemWithUse = GetEquipGameObject(item).GetComponent<IUsable>();
            itemWithUse.StartHandleInput(context);
            
        } catch {
            item.SwitchState(item.EquipState);
        }

    }
    public override void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        GameObject equipGameObject = GetEquipGameObject(item);
        IUsable itemWithUse = equipGameObject?.GetComponent<IUsable>();

        if (itemWithUse != null) {
            itemWithUse.EndHandleInput(context);
        }

        item.SwitchState(item.EquipState);
    }

}

