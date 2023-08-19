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
        HandleIfEquipChanges(item);

        Transform toolSlots = item.inv.toolcraftSlots.transform;
        Transform gunSlots = item.inv.guncraftSlots.transform;
        Transform craftSlots = item.inv.generalcraftSlots.transform;

        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object

        if (droppedSlot.transform.parent == toolSlots) {
            item.ToolcrafterState.TryCraftTool(item);
        }

        if ((droppedSlot.transform == toolSlots.GetChild(toolSlots.childCount-1)) || droppedSlot.transform == gunSlots.GetChild(gunSlots.childCount - 1) || droppedSlot.transform == craftSlots.GetChild(craftSlots.childCount - 2)) {
            if(droppedSlot.transform == craftSlots.GetChild(craftSlots.childCount - 1)){
                Debug.Log("REMOVING CRAFTING ING");
            }
            for (int i = 0; i < droppedSlot.transform.parent.childCount-1; i++) {
                Transform ingredient = droppedSlot.transform.parent.GetChild(i);
                Debug.Log(ingredient.gameObject.name);

                Slot ingredientToRemove = ingredient.GetComponent<Slot>();

                if (ingredientToRemove != null) {
                    item.inv.RemoveItem(ingredientToRemove.id);
                }
            }
        }

    }
}
