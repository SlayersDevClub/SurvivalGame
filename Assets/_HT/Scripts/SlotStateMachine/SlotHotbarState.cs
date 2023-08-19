using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SlotHotbarState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Debug.Log("SWITCHING TO HOTBAR");
        Color32 normalSlotColor = new Color32(198, 198, 198, 240);
        if (item.transform.GetComponent<Image>().color != normalSlotColor) {
            item.transform.GetComponent<Image>().color = normalSlotColor;
        }
        HandleIfEquipChanges(item);
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {

    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        HandleIfEquipChanges(item);

        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object

        Transform toolSlots = item.inv.toolcraftSlots.transform;
        Transform gunSlots = item.inv.guncraftSlots.transform;
        Transform craftSlots = item.inv.generalcraftSlots.transform;
        if ((droppedSlot.transform == toolSlots.GetChild(toolSlots.childCount - 1)) || droppedSlot.transform == gunSlots.GetChild(gunSlots.childCount - 1) || droppedSlot.transform == craftSlots.GetChild(craftSlots.childCount - 1)) {
            foreach (Transform ingredient in droppedSlot.transform.parent) {
                Slot ingredientToRemove = ingredient.GetComponent<Slot>();

                if (ingredientToRemove != null) {
                    item.inv.RemoveItem(ingredientToRemove.id);
                }
            }
        }
    }

}
