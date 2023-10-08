using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;


public class SlotInventoryState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        //item.gameObject.SetActive(false);
        HandleIfEquipChanges(item);

    }
    public override void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
}
