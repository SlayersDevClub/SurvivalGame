using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System;

public class Slot : MonoBehaviour, IDropHandler
{
	public int id;
	protected private Inventory inv;

	public virtual void Start()
	{
		inv = GameObject.Find("Inventory").GetComponent<Inventory>();
	}

    public void OnDrop(PointerEventData eventData) {
        ItemData droppedItem = eventData.pointerDrag.GetComponent<ItemData>();
        //If gun inventory dont allow placement in crafting output slot 
        if ((id == 19 && inv.inventoryState == Inventory.InvState.GunInv) || (inv.inventoryState == Inventory.InvState.CraftInv && id == 21)) {
            // Snap back the item to its original place when dropping on slot 19
            droppedItem.transform.SetParent(inv.slots[droppedItem.slotId].transform);
            droppedItem.transform.position = inv.slots[droppedItem.slotId].transform.position;
        }

        else if (inv.items[id].Id == -1) {
            if(droppedItem.slotId == 19) {
                int invSlotCount = inv.slots.Count;

                for (int i = 16; i < invSlotCount; i++) {
                    inv.RemoveItem(i);
                }
            }
            else if(droppedItem.slotId == 21) {
                int invSlotCount = inv.slots.Count;

                for (int i = 16; i < invSlotCount; i++) {
                    inv.RemoveItem(i);
                }
            }

            // Dropped into an empty slot
            inv.items[droppedItem.slotId] = new Item();
            inv.items[id] = droppedItem.item;
            droppedItem.slotId = id;

        } else if (droppedItem.slotId != id) {
            // Swapping items (except when the current slot is 19)
            Transform item = this.transform.GetChild(0);
            item.GetComponent<ItemData>().slotId = droppedItem.slotId;
            item.transform.SetParent(inv.slots[droppedItem.slotId].transform);
            item.transform.position = inv.slots[droppedItem.slotId].transform.position;

            droppedItem.slotId = id;
            droppedItem.transform.SetParent(this.transform);
            droppedItem.transform.position = this.transform.position;

            inv.items[droppedItem.slotId] = item.GetComponent<ItemData>().item;
            inv.items[id] = droppedItem.item;
        }

        switch (inv.inventoryState) {


            case Inventory.InvState.GunInv:
                List<BaseItemTemplate> gunParts = new List<BaseItemTemplate>();

                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[16].Id));
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[17].Id));
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[18].Id));
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[20].Id));
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[21].Id));
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[22].Id));

                //Returns assembled gun if needed for use
                CraftingBrain.AttemptBuildGun(gunParts);
                break;
            case Inventory.InvState.CraftInv:
                List<BaseItemTemplate> ingredients = new List<BaseItemTemplate>();

                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[16].Id));
                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[17].Id));
                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[18].Id));
                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[19].Id));
                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[20].Id));

                BaseItemTemplate output = CraftingBrain.AttemptCraft(ingredients);

                if(output != null) {
                    //Add item to inventory by item ID and slot number to add to
                    inv.AddItem(Int16.Parse(output.Id), 21);
                }
                break;
        }

    }

}