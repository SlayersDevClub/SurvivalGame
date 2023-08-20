using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public class SlotToolcrafterState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Debug.Log("SLOT TOOL");
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        HandleIfEquipChanges(item);
        TryCraftTool(item);
    }
}

