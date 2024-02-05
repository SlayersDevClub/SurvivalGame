using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class HotbarSlot : ItemSlot {
    Color32 normalSlotColor = new Color32(198, 198, 198, 240);
    Color32 equipSlotColor = Color.yellow;
    private bool equipSlot = false;

    public void SetAsEquipSlot() {
        ChangeColorOfSlot(equipSlotColor);
        EquipItemInSlot();
        equipSlot = true;
    }
    public void UnsetAsEquipSlot() {
        ChangeColorOfSlot(normalSlotColor);
        UnequipItemInSlot();
        equipSlot = false;
    }

    private void EquipItemInSlot() {
        //Unequip item first before equipping in event that item is dragged into currently equip slot
        if(itemInSlot != null) {
            GameObject itemToHold;

            if (inventory.itemHolders.ContainsKey(itemInSlotInfo.GetType())) {
                itemToHold = Instantiate(itemInSlotInfo.prefab, inventory.itemHolders[itemInSlotInfo.GetType()].transform);
            } else {
                itemToHold = Instantiate(itemInSlotInfo.prefab, inventory.defaultHolder.transform);
            }

            inventory.currentHeldItem = itemToHold;
        }
    }
    public void UnequipItemInSlot() {
        if(itemInSlot != null) {
            if(inventory.itemHolders.ContainsKey(itemInSlotInfo.GetType())){
                if (inventory.itemHolders[itemInSlotInfo.GetType()].transform.childCount > 0) {
                    Destroy(inventory.itemHolders[itemInSlotInfo.GetType()].transform.GetChild(0).gameObject);
                }
            } else {
                if (inventory.defaultHolder.transform.childCount > 0) {
                    Destroy(inventory.defaultHolder.transform.GetChild(0).gameObject);
                }
            }

            inventory.currentHeldItem = null;
        }
    }

    private void ChangeColorOfSlot(Color32 colorToChangeTo) {
        GetComponent<Image>().color = colorToChangeTo;
    }

    public override void PutItemInSlot(GameObject item) {
        base.PutItemInSlot(item);

        if (equipSlot) {
            UnequipItemInSlot();
            EquipItemInSlot();
        } 
    }

    public override void PickupItem(GameObject item, bool swapping = false) {
        if (equipSlot) {
            UnequipItemInSlot();
        }
        base.PickupItem(item, swapping);
    }


    /*
    public override void OnPointerDown(PointerEventData eventData) {
        if (NewestInventory.instance.currentDraggedItem != null && NewestInventory.instance.currentDraggedItem.GetComponent<ItemData>().GetItem().GetType() == equipSlotType) {
            base.OnPointerDown(eventData);
        }
    }

    public override bool PutItemInSlot(GameObject item) {
        if (NewestInventory.instance.currentDraggedItem != null && NewestInventory.instance.currentDraggedItem.GetComponent<ItemData>().GetItem().GetType() == equipSlotType) {
            base.PutItemInSlot(item);
        }
        return false;
    }*/
}
