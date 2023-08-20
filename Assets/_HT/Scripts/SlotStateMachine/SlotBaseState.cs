using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public abstract class SlotBaseState {

    public abstract void EnterState(SlotStateMachine item);

    public abstract void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot);

    public abstract void HandleInput(SlotStateMachine item, InputAction.CallbackContext context);


public virtual void HandleDropAndSwap(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        ItemData droppedItem = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object
        Slot thisSlot = slot.GetComponent<Slot>();

        if (item.inv.items[slotID].Id == -1) {
            item.inv.items[droppedItem.slotId] = new Item();
            item.inv.items[slotID] = droppedItem.item;
            droppedItem.slotId = thisSlot.id;

            Debug.Log("EMPTY SLOT");
        } else {
            Transform itemTransform = thisSlot.transform.GetChild(0);

            ItemData slotItemData = itemTransform.GetComponent<ItemData>();
            slotItemData.slotId = droppedItem.slotId;

            // Create a new item to swap and copy properties
            Item newItem = new Item();
            newItem.Id = slotItemData.item.Id != -1 ? slotItemData.item.Id : -1;
            // Copy other properties similarly

            item.inv.items[droppedItem.slotId] = newItem;

            // Swap the items
            newItem = new Item();
            newItem.Id = droppedItem.item.Id != -1 ? droppedItem.item.Id : -1;
            // Copy other properties similarly

            item.inv.items[slotID] = newItem;

            // Update positions and parent transforms
            itemTransform.SetParent(item.inv.slots[droppedItem.slotId].transform);
            itemTransform.position = item.inv.slots[droppedItem.slotId].transform.position;

            droppedItem.slotId = slotID;
            droppedItem.transform.SetParent(thisSlot.transform);
            droppedItem.transform.position = thisSlot.transform.position;

            Debug.Log("SWAPPED");
            
        }
        HandleIfEquipChanges(item);

    }


public virtual void HandleIfEquipChanges(SlotStateMachine item) {
        
        BaseItemTemplate equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.player.equipItemSlot].Id);

        if (equipItem != item.player.equipItem){
            Unequip(item);

            item.player.equipItem = equipItem;

            Equip(item);
        }
    }
    public void Unequip(SlotStateMachine item) {
        if (item.player.transform.Find("Model/ItemHolder/Resource").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Resource").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Gun").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Gun").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Tool").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Tool").GetChild(0).gameObject);
        }
    }

    public void Equip(SlotStateMachine item) {
        ResourceTemplate resource = item.player.equipItem as ResourceTemplate;
        GunTemplate gun = item.player.equipItem as GunTemplate;
        ToolTemplate tool = item.player.equipItem as ToolTemplate;

        if (resource != null) {
            GameObject.Instantiate(item.player.equipItem.prefab, item.player.transform.Find("Model/ItemHolder/Resource").transform);
        } else if (gun != null) {
            GameObject.Instantiate(item.player.equipItem.prefab, item.player.transform.Find("Model/ItemHolder/Gun").transform);
        } else if (tool != null) {
            GameObject.Instantiate(item.player.equipItem.prefab, item.player.transform.Find("Model/ItemHolder/Tool").transform);
        }
    }

    public void ClearCraftersSlots(SlotStateMachine item) {
        ClearCrafterSlots(item, item.player.inv.toolcraftSlots);
        ClearCrafterSlots(item, item.player.inv.guncraftSlots);
        ClearCrafterSlots(item, item.player.inv.generalcraftSlots);
    }

    private void ClearCrafterSlots(SlotStateMachine item, GameObject crafter) {
        foreach (Transform slot in crafter.transform) {
            Slot curSlot = slot.GetComponent<Slot>();

            if(curSlot != null) {
                item.player.inv.RemoveItem(curSlot.id);
            }
        }
    }

}
