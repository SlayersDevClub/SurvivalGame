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
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        HandleDropAndSwap(item, pointerEventData, slotID, slot);


        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object
        /*
        if (droppedSlot.transform.parent == toolSlots) {
            item.ToolcrafterState.TryCraftTool(item);
        }
        */


        if ((droppedSlot.transform.GetComponent<SlotStateMachine>().GetCurrentState() as SlotOutputState != null)) {
            ClearCraftersSlots(item);
        }

    }
}
