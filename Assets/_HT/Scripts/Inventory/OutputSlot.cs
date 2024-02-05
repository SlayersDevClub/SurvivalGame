using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System;

public class OutputSlot : ItemSlot {
    public override void OnPointerDown(PointerEventData eventData) {
        if(itemInSlot != null && inventory.currentDraggedItem == null) {
            PickupItem(itemInSlot);
        }
    }
    //Picking up item from output slot should clear all tool slots
    public override void PickupItem(GameObject item, bool swapping = false) {
        base.PickupItem(item, swapping);

        ClearInputSlots();
    }

    public virtual void ClearInputSlots() {
        
    }
}
