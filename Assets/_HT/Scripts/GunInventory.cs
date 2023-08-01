using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GunInventory : Inventory
{
	int chestSlots = 7;

	public Inventory inv;
	public override void Start() {
		slotAmount = 8;
		inventoryPanel = GameObject.Find("InventoryPanel");
		slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;
	}
	public void OpenWeaponTable() {
		inv.inventoryState = InvState.GunInv;

		slots = inv.slots;
		items = inv.items;

		int curSlots = slots.Count;
		for (int i = curSlots; i < curSlots + chestSlots; i++) {

			items.Add(new Item());
			slots.Add(Instantiate(inventorySlot));
			slots[i].GetComponent<Slot>().id = i;
			slots[i].transform.SetParent(slotPanel.transform);
		}
	}


	public override void AddItem(int id, int slotNum = -1) {
		Item itemToAdd = ItemDatabase.FetchItemById(id);
		
		if (slotNum != -1) {
			items[slotNum] = itemToAdd;
			GameObject itemObj = Instantiate(inventoryItem);
			itemObj.GetComponent<ItemData>().item = itemToAdd;
			itemObj.GetComponent<ItemData>().slotId = slotNum;
			itemObj.transform.SetParent(slots[slotNum].transform);
			itemObj.transform.localPosition = Vector2.zero;
			itemObj.GetComponent<Image>().sprite = itemToAdd.Sprite;
			itemObj.name = "Item: " + itemToAdd.Title;
			slots[slotNum].name = "Slot: " + itemToAdd.Title;
        } else {
			for (int i = 16; i < 20; i++) {
				if (items[i].Id == -1) {
					Debug.Log("EMPOTY SLOT");
					Debug.Log(i);
					items[i] = itemToAdd;
					GameObject itemObj = Instantiate(inventoryItem);
					itemObj.GetComponent<ItemData>().item = itemToAdd;
					itemObj.GetComponent<ItemData>().slotId = i;
					itemObj.transform.SetParent(slots[i].transform);
					itemObj.transform.localPosition = Vector2.zero;
					itemObj.GetComponent<Image>().sprite = itemToAdd.Sprite;
					itemObj.name = "Item: " + itemToAdd.Title;
					slots[i].name = "Slot: " + itemToAdd.Title;
					break;
				}
			}
		}


	}

	public void CloseWeaponTable() {
		inv.inventoryState = InvState.PlayerInv;
		// Loop through the slots list in reverse order to safely remove elements
		for (int i = slots.Count - 1; i >= slotAmount; i--) {
			// Destroy the slot GameObject
			Destroy(slots[i].gameObject);
			// Remove the corresponding item from the 'items' list if needed
			if (i < items.Count) {
				items.RemoveAt(i);
			}
			// Remove the slot from the 'slots' list
			slots.RemoveAt(i);
		}
	}
}
