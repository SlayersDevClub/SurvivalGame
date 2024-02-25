using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System;

public class ItemSlot : MonoBehaviour, IPointerDownHandler {
    public Inventory inventory;

    public BaseItemTemplate itemInSlotInfo;
    public GameObject itemInSlot = null;

    //When item is dropped in slot
    public virtual void OnPointerDown(PointerEventData eventData) {

        Debug.Log("ItemSlot OnPointerDown Called");

        //If item in this slot was null make it the dropped item then make the currently dragged item null
        if (itemInSlot == null) {
            if (inventory.currentDraggedItem.Value != null) {
                Debug.Log("test3");
                PutItemInSlot(inventory.currentDraggedItem.Value);
            }
        } else {
            if (inventory.currentDraggedItem.Value == null) {
                Debug.Log("test1");
                PickupItem(itemInSlot);
            } else {
                Debug.Log("test2");
                SwapItems(inventory.currentDraggedItem.Value, itemInSlot);
            }
        }
    }
    
    public virtual void SwapItems(GameObject heldItem, GameObject itemInSlot) {
        PutItemInSlot(heldItem);
        PickupItem(itemInSlot, true);
    }

    public virtual void PutItemInSlot(GameObject item) {
        inventory.currentDraggedItem.Value = null;
        
        item.transform.position = transform.position;
        item.transform.SetParent(transform);
        itemInSlot = item;
        itemInSlotInfo = itemInSlot.GetComponent<ItemData>().item;
    }

    public virtual void PickupItem(GameObject item, bool swapping = false) {
        inventory.currentDraggedItem.Value = item;

        if (!swapping) {
            itemInSlot = null;
            itemInSlotInfo = null;
        }
    }

    //Add created item to slot rather than "Put" existing item from hand
    public void AddItemToSlot(GameObject item) {
        item.transform.position = transform.position;
        item.transform.SetParent(transform);

        itemInSlot = item;
        itemInSlotInfo = itemInSlot.GetComponent<ItemData>().item;
    }

    public void RemoveItemFromSlot() {
        Destroy(itemInSlot);

        itemInSlot = null;
        itemInSlotInfo = null;
    }

    private void Update() {
        if(inventory.currentDraggedItem.Value != null) {
            inventory.currentDraggedItem.Value.transform.position = Input.mousePosition;
        }
    }

}
