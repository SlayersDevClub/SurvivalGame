using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System.Collections.Generic;

public class ToolcrafterSlot : CrafterSlot {

    public override void CraftItem(BaseItemTemplate itemBeingCrafted) {
        AddCraftToJSON(itemBeingCrafted);
        GameObject inventoryItemCreated = inventory.itemDatabase.FetchItemGameObject(itemBeingCrafted);
        inventory.toolcrafterOutputSlot.AddItemToSlot(inventoryItemCreated);
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

        foreach (ToolcrafterSlot slot in inventory.toolcrafterItemSlots) {
            toolParts.Add(slot.itemInSlotInfo);
        }

        return inventory.craftingBrain.AttemptBuildTool(toolParts);
    }

}
