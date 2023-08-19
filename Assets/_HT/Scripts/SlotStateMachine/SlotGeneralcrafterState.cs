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
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        HandleIfEquipChanges(item);

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
