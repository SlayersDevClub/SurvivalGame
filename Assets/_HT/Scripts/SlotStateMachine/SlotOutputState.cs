using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
public class SlotOutputState : SlotBaseState
{
    public override void EnterState(SlotStateMachine item) {
        
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        Debug.Log("OUTPUT SLOT");

        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>();

        if (droppedSlot.transform == item.inv.toolcraftSlots.transform.GetChild(item.inv.toolcraftSlots.transform.childCount - 1)) {
            return;
        }
    }
}
