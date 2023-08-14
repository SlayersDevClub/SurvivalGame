using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;


public class SlotGuncrafterState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Debug.Log("GUNSLOT ENTER");
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

        
        List<BaseItemTemplate> gunParts = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.guncraftSlots.transform) {
            GameObject gunSlot = slotTransform.gameObject;
            gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[gunSlot.GetComponent<Slot>().id].Id));
        }

        BaseItemTemplate maybeNewGun = CraftingBrain.AttemptBuildGun(gunParts);
        GunTemplate newGun = maybeNewGun as GunTemplate;

        if (newGun != null) {
            JsonDataManager.AddBaseItemTemplateToJson(maybeNewGun);
            newGun.Id = "999";
            item.inv.AddItem(Int16.Parse(newGun.Id), item.inv.guncraftSlots.transform.GetChild(item.inv.guncraftSlots.transform.childCount -1).GetComponent<Slot>().id);
        }


    }

}
