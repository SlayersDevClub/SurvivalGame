using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine;
using System.Collections.Generic;

public abstract class CrafterSlot : ItemSlot {
    public abstract void CraftItem(BaseItemTemplate itemBeingCrafted);

    public void AddCraftToJSON(BaseItemTemplate craftedItem) {
        inventory.itemDatabase.AddBaseItemTemplate(craftedItem);
        JsonDataManager.AddBaseItemTemplateToJson(craftedItem);
    }
}
