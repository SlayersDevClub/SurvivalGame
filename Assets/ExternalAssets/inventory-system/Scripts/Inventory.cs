using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class Inventory : MonoBehaviour
{

	protected GameObject inventoryPanel;
	protected GameObject slotPanel;
	public GameObject inventorySlot;
	public GameObject inventoryItem;

	protected private int slotAmount = 16;
	public List<Item> items = new List<Item>();
	public List<GameObject> slots = new List<GameObject>();

	public enum InvState{ PlayerInv, ChestInv, GunInv, SwordInv, CraftInv };
	public InvState inventoryState;
	public virtual void Start()
	{
		ItemDatabase.Initialize();

		inventoryState = InvState.PlayerInv;
		inventoryPanel = GameObject.Find("InventoryPanel");
		slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;
		for (int i = 0; i < slotAmount; i++)
		{
			items.Add(new Item());
			slots.Add(Instantiate(inventorySlot));
			slots[i].GetComponent<Slot>().id = i;
			slots[i].transform.SetParent(slotPanel.transform);
		}
		StartCoroutine(waitadd());

	}

	IEnumerator waitadd() {
		yield return new WaitForSeconds(1f);
	}

	public void RemoveItem(int slotNum) {
		// Check if the slot index is within the valid range
		if (slotNum >= 0 && slotNum < items.Count) {
			// Set the item in the specified slot to an empty item or placeholder
			items[slotNum] = new Item();

			// Here, you can also remove the GameObject representing the item from the UI
			// For example:
			if (slots[slotNum].transform.childCount > 0) {
				Destroy(slots[slotNum].transform.GetChild(0).gameObject);
			}
		}
	}

	public virtual void AddItem(int id, int slotNum = -1)
	{
		Item itemToAdd = ItemDatabase.FetchItemById(id);
		if(slotNum != -1) {
			items[slotNum] = itemToAdd;
			GameObject itemObj = Instantiate(inventoryItem);
			itemObj.GetComponent<ItemData>().item = itemToAdd;
			itemObj.GetComponent<ItemData>().slotId = slotNum;
			itemObj.transform.SetParent(slots[slotNum].transform);
			itemObj.transform.localPosition = Vector2.zero;
			itemObj.GetComponent<Image>().sprite = itemToAdd.Sprite;
			itemObj.name = "Item: " + itemToAdd.Title;
			slots[slotNum].name = "Slot: " + itemToAdd.Title;
		}

		else if (itemToAdd.Stackable && CheckIfItemIsInInventory(itemToAdd))
		{
			for (int i = 0; i < items.Count; i++)
			{
				if (items[i].Id == id)
				{
					ItemData data = slots[i].transform.GetChild(0).GetComponent<ItemData>();
					data.amount++;
					data.transform.GetChild(0).GetComponent<Text>().text = data.amount.ToString();
					break;
				}
			}
		}
		else
		{
			for (int i = 0; i < items.Count; i++)
			{
				if (items[i].Id == -1)
				{
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

	protected bool CheckIfItemIsInInventory(Item item)
	{
		for (int i = 0; i < items.Count; i++)
		{
			if (items[i].Id == item.Id)
			{
				return true;
			}
		}

		return false;
	}

}
