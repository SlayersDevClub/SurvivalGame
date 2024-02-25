public class ToolOutputSlot : OutputSlot {
    public override void ClearInputSlots() {
        foreach (ItemSlot slot in inventory.itemSlots) {
            slot.RemoveItemFromSlot();
        }
    }
}
