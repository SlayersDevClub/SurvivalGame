using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System;

public class ToolOutputSlot : OutputSlot {
    public override void ClearInputSlots() {
        foreach(ToolcrafterSlot slot in inventory.toolcrafterItemSlots) {
            slot.RemoveItemFromSlot();
        }
    }
}
