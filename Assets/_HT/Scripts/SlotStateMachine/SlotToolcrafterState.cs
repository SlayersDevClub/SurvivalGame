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
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        HandleIfEquipChanges(item);
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

