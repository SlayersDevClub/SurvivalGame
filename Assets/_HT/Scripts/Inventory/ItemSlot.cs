using UnityEngine.EventSystems;
using UnityEngine;

public class ItemSlot : MonoBehaviour, IPointerDownHandler {
    public Inventory inventory;

    public BaseItemTemplate itemInSlotInfo;
    public GameObject itemInSlot = null;

    //When item is dropped in slot
    public virtual void OnPointerDown(PointerEventData eventData) {
        //If item in this slot was null make it the dropped item then make the currently dragged item null
        if (itemInSlot == null) {
            if (inventory.currentDraggedItem.Value != null) {
                PutItemInSlot(inventory.currentDraggedItem.Value);
            }
        } else {
            if (inventory.currentDraggedItem.Value == null) {
                PickupItem(itemInSlot);
            } else {
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
