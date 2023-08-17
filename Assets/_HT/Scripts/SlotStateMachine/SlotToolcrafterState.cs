using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public class SlotToolcrafterState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Debug.Log("SLOT TOOL");
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
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

        TryCraftTool(item);
    }

    public void TryCraftTool(SlotStateMachine item) {
        //item.inv.RemoveItem(item.inv.toolcraftSlots.transform.GetChild(item.inv.toolcraftSlots.transform.childCount - 1).GetComponent<Slot>().id);
    

        List<BaseItemTemplate> toolParts = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.toolcraftSlots.transform) {
            GameObject toolSlot = slotTransform.gameObject;

            Slot slotItem = toolSlot.GetComponent<Slot>();

            if (slotItem != null) {
                toolParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[slotItem.GetComponent<Slot>().id].Id));
            }
        }

        BaseItemTemplate maybeNewTool = CraftingBrain.AttemptBuildTool(toolParts);
        ToolTemplate newTool = maybeNewTool as ToolTemplate;

        if (newTool != null) {
            
            JsonDataManager.AddBaseItemTemplateToJson(newTool);
            ItemDatabase.Initialize();
            //Add item to inventory by item ID and slot number to add to
            Slot outputSlot = item.inv.toolcraftSlots.transform.GetChild(item.inv.toolcraftSlots.transform.childCount - 1).GetComponent<Slot>();

            if(outputSlot != null) {
                item.inv.AddItem(Int16.Parse(newTool.Id), outputSlot.GetComponent<Slot>().id);
            }
        }
    }
}

