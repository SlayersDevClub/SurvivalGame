using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System;

public class GunOutputSlot : OutputSlot {
    public override void ClearInputSlots() {
        foreach(GuncrafterSlot slot in inventory.guncrafterItemSlots) {
            slot.RemoveItemFromSlot();
        }
    }
}
