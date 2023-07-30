using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class ChestInventory : Inventory
{
	int chestSlots = 8;

	public override void Start() {
		database = GetComponent<ItemDatabase>();
		slotAmount = 8;
		inventoryPanel = GameObject.Find("ChestInventoryPanel");
		slotPanel = inventoryPanel.transform.Find("ChestSlotPanel").gameObject;
	}
	public void OpenChest() {
		for (int i = 0; i < slotAmount; i++) {
			items.Add(new Item());
			slots.Add(Instantiate(inventorySlot));
			slots[i].GetComponent<Slot>().id = i;
			slots[i].transform.SetParent(slotPanel.transform);
		}



		AddItem(2584);
	}


	public override void AddItem(int id) {
		Item itemToAdd = database.FetchItemById(id);

		if (itemToAdd.Stackable && CheckIfItemIsInInventory(itemToAdd)) {
			for (int i = 0; i < items.Count; i++) {
				if (items[i].Id == id) {
					ItemData data = slots[i].transform.GetChild(0).GetComponent<ItemData>();
					data.amount++;
					data.transform.GetChild(0).GetComponent<Text>().text = data.amount.ToString();
					break;
				}
			}
		} else {
			for (int i = 0; i < chestSlots; i++) {
				if (items[i].Id == -1) {
					items[i] = itemToAdd;
					GameObject itemObj = Instantiate(inventoryItem);
					itemObj.GetComponent<ItemData>().item = itemToAdd;
					itemObj.GetComponent<ItemData>().slotId = i;
					itemObj.transform.SetParent(slots[i].transform);
					itemObj.transform.position = Vector2.zero;
					itemObj.GetComponent<Image>().sprite = itemToAdd.Sprite;
					itemObj.name = "Item: " + itemToAdd.Title;
					slots[i].name = "Slot: " + itemToAdd.Title;
					break;
				}
			}
		}
	}

	public void CloseChest() {
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
