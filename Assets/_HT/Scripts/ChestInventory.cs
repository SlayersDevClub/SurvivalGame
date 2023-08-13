using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class ChestInventory : Inventory
{



	public override void AddItem(int id, int slotNum = -1) {
		Item itemToAdd = ItemDatabase.FetchItemById(id);


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
