using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;

public class SlotGeneralcrafterState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        ItemData droppedSlot = pointerEventData.pointerDrag.GetComponent<ItemData>();

        item.inv.items[droppedSlot.slotId] = new Item();
        item.inv.items[slotID] = droppedSlot.item;
        droppedSlot.slotId = slotID;

        if (droppedSlot.slotId != slotID) {
            // Swapping items (except when the current slot is 19)
            Transform newSlot = slot.transform.GetChild(0);
            newSlot.GetComponent<ItemData>().slotId = droppedSlot.slotId;
            newSlot.transform.SetParent(item.inv.slots[droppedSlot.slotId].transform);
            item.transform.position = item.inv.slots[droppedSlot.slotId].transform.position;

            droppedSlot.slotId = slotID;
            droppedSlot.transform.SetParent(slot.transform);
            droppedSlot.transform.position = slot.transform.position;

            item.inv.items[droppedSlot.slotId] = newSlot.GetComponent<ItemData>().item;
            item.inv.items[slotID] = droppedSlot.item;
        }

        List<BaseItemTemplate> ingredients = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.generalcraftSlots.transform) {
            GameObject craftSlot = slotTransform.gameObject;
            ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[craftSlot.GetComponent<Slot>().id].Id));
        }

        BaseItemTemplate output = CraftingBrain.AttemptCraft(ingredients);

        if (output != null) {
            item.inv.AddItem(Int16.Parse(output.Id), item.transform.parent.GetChild(item.transform.parent.childCount - 1).GetComponent<Slot>().id);
        }
    }

}
