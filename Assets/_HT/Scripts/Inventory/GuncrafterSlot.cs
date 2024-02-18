using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System.Collections.Generic;

public class GuncrafterSlot : CrafterSlot {
    public override void CraftItem(BaseItemTemplate itemBeingCrafted) {
        AddCraftToJSON(itemBeingCrafted);
        GameObject inventoryItemCreated = inventory.itemDatabase.FetchItemGameObject(itemBeingCrafted);
        inventory.guncrafterOutputSlot.AddItemToSlot(inventoryItemCreated);
    }
    public override void PutItemInSlot(GameObject item) {
        base.PutItemInSlot(item);

        GunTemplate craftedGun = TryCraftGun() as GunTemplate;

        if (craftedGun != null) {
            CraftItem(craftedGun);
        }

    }

    private BaseItemTemplate TryCraftGun() {
        List<BaseItemTemplate> gunParts = new List<BaseItemTemplate>();

        foreach (GuncrafterSlot slot in inventory.guncrafterItemSlots) {
            gunParts.Add(slot.itemInSlotInfo);
        }

        return inventory.craftingBrain.AttemptBuildGun(gunParts);
    }
}
