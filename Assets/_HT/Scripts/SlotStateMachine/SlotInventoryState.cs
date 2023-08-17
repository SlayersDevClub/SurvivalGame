using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;


public class SlotInventoryState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        //item.gameObject.SetActive(false);
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
        if (slot.GetComponent<Slot>().id != item.player.equipItemSlot) {
            if (GameObject.Find("Resource").transform.childCount > 0) {
                GameObject.Destroy(GameObject.Find("Resource").transform.GetChild(0).gameObject);
            } else if (GameObject.Find("Gun").transform.childCount > 0) {
                GameObject.Destroy(GameObject.Find("Gun").transform.GetChild(0).gameObject);
            } else if (GameObject.Find("Tool").transform.childCount > 0) {
                GameObject.Destroy(GameObject.Find("Tool").transform.GetChild(0).gameObject);
            }
        } else {
            BaseItemTemplate equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.transform.GetComponent<Slot>().id].Id);


            item.player.equipItemSlot = item.transform.GetComponent<Slot>().id;
            item.player.equipItem = equipItem;

            //ADD PLAYER ITEM HERE SO WHEN USING IS CALLED IT FIRES WEAPON OR KNOW WHAT TYPE OF WEAPON IT IS    player.equip

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

        Transform toolSlots = item.inv.toolcraftSlots.transform;
        Transform gunSlots = item.inv.guncraftSlots.transform;
        Transform craftSlots = item.inv.generalcraftSlots.transform;

        if(droppedSlot.transform.parent == toolSlots) {
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
