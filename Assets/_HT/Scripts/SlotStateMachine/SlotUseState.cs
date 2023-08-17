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
        if (context.started) {
            GunTemplate equipGun = item.player.equipItem as GunTemplate;
            ToolTemplate equipTool = item.player.equipItem as ToolTemplate;
            ResourceTemplate equipResource = item.player.equipItem as ResourceTemplate;

            if (equipGun != null) {
                Debug.Log("Shooting");
            }
            if (equipTool != null) {
                Debug.Log("Mining");
            }
            if (equipResource != null) {
                Debug.Log("Using Resource");
            }
        }
        if (context.canceled) {
            item.SwitchState(item.EquipState);
        }

    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
       
    }
}

