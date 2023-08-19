using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;


public class SlotGuncrafterState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
    }
    public override void HandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        
    }
    public override void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        HandleDropAndSwap(item, pointerEventData, slotID, slot);
        HandleIfEquipChanges(item);

        List<BaseItemTemplate> gunParts = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.guncraftSlots.transform) {
            GameObject gunSlot = slotTransform.gameObject;

            Slot slotItem = gunSlot.GetComponent<Slot>();

            if (slotItem != null) {
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[slotItem.GetComponent<Slot>().id].Id));
            }
        }

        BaseItemTemplate maybeNewGun = CraftingBrain.AttemptBuildGun(gunParts);
        GunTemplate newGun = maybeNewGun as GunTemplate;

        if (newGun != null) {
            JsonDataManager.AddBaseItemTemplateToJson(maybeNewGun);
            ItemDatabase.Initialize();
            item.inv.AddItem(Int16.Parse(newGun.Id), item.inv.guncraftSlots.transform.GetChild(item.inv.guncraftSlots.transform.childCount -1).GetComponent<Slot>().id);
        }


    }

}
