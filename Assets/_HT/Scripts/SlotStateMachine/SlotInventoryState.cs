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
        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object
        int cameFromSlotNum = droppedSlot.slotId;

        HandleDropAndSwap(item, pointerEventData, slotID, slot);

        if (item.inv.slots[cameFromSlotNum].TryGetComponent<SlotStateMachine>(out SlotStateMachine droppedSlotStateMachine)) {
            if(droppedSlotStateMachine.GetCurrentState() as SlotOutputState != null) {
                ClearCraftersSlots(item);
            }
        }

        TryCraftTool(item);
        TryCraftGun(item);
        TryGeneralCraft(item);
    }
}
