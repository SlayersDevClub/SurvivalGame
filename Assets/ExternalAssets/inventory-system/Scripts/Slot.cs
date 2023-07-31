using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using System.Collections.Generic;

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
        if (droppedItem.slotId != id && id == 19 && (inv.inventoryState != Inventory.InvState.PlayerInv || inv.inventoryState != Inventory.InvState.ChestInv)) {
            // Snap back the item to its original place when dropping on slot 19
            droppedItem.transform.SetParent(inv.slots[droppedItem.slotId].transform);
            droppedItem.transform.position = inv.slots[droppedItem.slotId].transform.position;
        }

        else if (inv.items[id].Id == -1) {
            // Dropped into an empty slot
            inv.items[droppedItem.slotId] = new Item();
            inv.items[id] = droppedItem.item;
            droppedItem.slotId = id;

        } else if (droppedItem.slotId != id && id != 19) {
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
                List<BaseItemTemplate> ingredients = new List<BaseItemTemplate>();

                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(inv.items[16].Id));

                Debug.Log(ingredients.Count);

                //CraftingBrain.AttemptBuildGun();
                break;
        }

    }

}