using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public abstract class SlotBaseState {

    public abstract void EnterState(SlotStateMachine item);

    public abstract void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot);

    public abstract void HandleInput(SlotStateMachine item, InputAction.CallbackContext context);

}
