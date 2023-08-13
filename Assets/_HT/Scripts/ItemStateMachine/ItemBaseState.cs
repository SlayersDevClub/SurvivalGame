using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public abstract class ItemBaseState
{

    public abstract void EnterState(ItemStateMachine item);

    public abstract void OnDrop(ItemStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot);

    public abstract void HandleInput(ItemStateMachine item, InputAction.CallbackContext context);

}
