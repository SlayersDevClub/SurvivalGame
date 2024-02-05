using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System.Collections.Generic;

public class GeneralcrafterSlot : CrafterSlot {

    public override void CraftItem(BaseItemTemplate itemBeingCrafted) {
        GameObject inventoryItemCreated = inventory.itemDatabase.FetchItemGameObject(itemBeingCrafted);
        inventory.generalcrafterOutputSlot.AddItemToSlot(inventoryItemCreated);
    }
    public override void PutItemInSlot(GameObject item) {
        base.PutItemInSlot(item);

        BaseItemTemplate craftedItem = TryCraftItem();

        if (craftedItem != null) {
            CraftItem(craftedItem);
        }

    }

    private BaseItemTemplate TryCraftItem() {
        List<BaseItemTemplate> ingredients = new List<BaseItemTemplate>();

        foreach (GuncrafterSlot slot in inventory.guncrafterItemSlots) {
            ingredients.Add(slot.itemInSlotInfo);
        }

        return inventory.craftingBrain.AttemptCraft(ingredients);
    }
}
