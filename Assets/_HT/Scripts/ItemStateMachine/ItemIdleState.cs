using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
    using UnityEngine.EventSystems;


public class ItemIdleState : ItemBaseState
{

    public override void EnterState(ItemStateMachine item) {

    }
    public override void HandleInput(ItemStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void OnDrop(ItemStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        throw new System.NotImplementedException();
    }

}
