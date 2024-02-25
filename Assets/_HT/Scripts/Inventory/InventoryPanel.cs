using System.Linq;
using UnityEngine;

public class InventoryPanel : MonoBehaviour
{
    public Inventory inventory;
    public CanvasGroup inventoryGrid, gunCrafterGrid, toolCrafterGrid, chestGrid, generalCraftGrid;
    // Start is called before the first frame update
    void Start()
    {
        FindInventorySlots();
        SetSlotsInventory();

        SetupItemHolders();
        inventory.EquipSlot(0);
    }
    private void SetupItemHolders() {
        inventory.itemHolders[typeof(StructureTemplate)] = inventory.structureHolder;
        inventory.itemHolders[typeof(GunTemplate)] = inventory.gunHolder;
        inventory.itemHolders[typeof(ResourceTemplate)] = inventory.resourceHolder;
        inventory.itemHolders[typeof(ToolTemplate)] = inventory.toolHolder;
    }

    private void FindInventorySlots() {
        inventory.inventoryItemSlots = GetComponentsInChildren<ItemSlot>(true).ToList();
        inventory.hotbarItemSlots = GetComponentsInChildren<HotbarSlot>(true).ToList();
        inventory.guncrafterItemSlots = GetComponentsInChildren<GuncrafterSlot>(true).ToList();
        //inventory.toolcrafterItemSlots = GetComponentsInChildren<ToolcrafterSlot>(true).ToList();

        //inventory.toolcrafterOutputSlot = GetComponentInChildren<ToolOutputSlot>(true);
        inventory.guncrafterOutputSlot = GetComponentInChildren<GunOutputSlot>(true);
    }


    private void SetSlotsInventory() {
        foreach(ItemSlot slot in inventory.inventoryItemSlots) {
            slot.inventory = inventory;
        }
        foreach (HotbarSlot slot in inventory.hotbarItemSlots) {
            slot.inventory = inventory;
        }
        foreach (GuncrafterSlot slot in inventory.guncrafterItemSlots) {
            slot.inventory = inventory;
        }
        //foreach (ToolcrafterSlot slot in inventory.toolcrafterItemSlots) {
        //    slot.inventory = inventory;
        //}
        //inventory.toolcrafterOutputSlot.inventory = inventory;
        inventory.guncrafterOutputSlot.inventory = inventory;
    }

}
