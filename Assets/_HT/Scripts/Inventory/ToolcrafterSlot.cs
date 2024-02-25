using UnityEngine;
using System.Collections.Generic;

public class ToolcrafterSlot : CrafterSlot {
    public override void CraftItem(BaseItemTemplate itemBeingCrafted) {
        AddCraftToJSON(itemBeingCrafted);
        GameObject inventoryItemCreated = inventory.itemDatabase.FetchItemGameObject(itemBeingCrafted);
        inventory.outputSlot.AddItemToSlot(inventoryItemCreated);
    }
    public override void PutItemInSlot(GameObject item) {
        base.PutItemInSlot(item);

        ToolTemplate craftedTool = TryCraftTool() as ToolTemplate;
        
        if(craftedTool != null) {
            CraftItem(craftedTool);
        }

    }

    private BaseItemTemplate TryCraftTool() {
        List<BaseItemTemplate> toolParts = new List<BaseItemTemplate>();

        foreach (ItemSlot slot in inventory.itemSlots) {
            toolParts.Add(slot.itemInSlotInfo);
        }

        return inventory.craftingBrain.AttemptBuildTool(toolParts);
    }

}
