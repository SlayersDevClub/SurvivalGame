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

        if (item.inv.items[thisSlot.id].Id == -1) {
            item.inv.items[droppedItem.slotId] = new Item();
            item.inv.items[thisSlot.id] = droppedItem.item;
            droppedItem.slotId = thisSlot.id;
        } else if (droppedItem.slotId != thisSlot.id) {
            Transform itemTransform = thisSlot.transform.GetChild(0);
            ItemData slotItemData = itemTransform.GetComponent<ItemData>();
            slotItemData.slotId = droppedItem.slotId;
            itemTransform.SetParent(item.inv.slots[droppedItem.slotId].transform);
            itemTransform.position = item.inv.slots[droppedItem.slotId].transform.position;

            droppedItem.slotId = thisSlot.id;
            droppedItem.transform.SetParent(thisSlot.transform);
            droppedItem.transform.position = thisSlot.transform.position;

            item.inv.items[droppedItem.slotId] = slotItemData.item;
            item.inv.items[thisSlot.id] = droppedItem.item;
        }
    }

    public virtual void HandleIfEquipChanges(SlotStateMachine item) {
        BaseItemTemplate equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.player.equipItemSlot].Id);

        if (equipItem != item.player.equipItem){
            Unequip(item);
            Equip(item, equipItem);
        }
    }
    public void Unequip(SlotStateMachine item) {
        if (GameObject.Find("Resource").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Resource").transform.GetChild(0).gameObject);
        } else if (GameObject.Find("Gun").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Gun").transform.GetChild(0).gameObject);
        } else if (GameObject.Find("Tool").transform.childCount > 0) {
            GameObject.Destroy(GameObject.Find("Tool").transform.GetChild(0).gameObject);
        }
    }

    public void Equip(SlotStateMachine item, BaseItemTemplate equipItem) {
        item.player.equipItem = equipItem;

        ResourceTemplate resource = equipItem as ResourceTemplate;
        GunTemplate gun = equipItem as GunTemplate;
        ToolTemplate tool = equipItem as ToolTemplate;

        if (resource != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Resource").transform);
        } else if (gun != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Gun").transform);
        } else if (tool != null) {
            GameObject.Instantiate(equipItem.prefab, GameObject.Find("Tool").transform);
        }
    }

}
