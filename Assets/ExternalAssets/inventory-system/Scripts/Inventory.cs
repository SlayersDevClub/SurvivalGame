﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class Inventory : MonoBehaviour
{

	protected GameObject inventoryPanel;
	protected GameObject slotPanel;
	public GameObject hotbarSlots;
	public GameObject inventorySlots;
	public GameObject toolcraftSlots;
	public GameObject guncraftSlots;
	public GameObject generalcraftSlots;
	public GameObject chestSlots;

	private GameObject[] slotsContainers;

	public GameObject inventorySlot;
	public GameObject inventoryItem;

	public List<Item> items = new List<Item>();
	public List<GameObject> slots = new List<GameObject>();

	public void Start() {
		ItemDatabase.Initialize();
		inventoryPanel = GameObject.Find("InventoryPanel").gameObject;
		slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;

		hotbarSlots = slotPanel.transform.Find("HotbarSlots").gameObject;
		inventorySlots = slotPanel.transform.Find("InventorySlots").gameObject;
		toolcraftSlots = slotPanel.transform.Find("ToolcraftSlots").gameObject;
		guncraftSlots = slotPanel.transform.Find("GuncraftSlots").gameObject;
		generalcraftSlots = slotPanel.transform.Find("GeneralcraftSlots").gameObject;
		chestSlots =slotPanel.transform.Find("ChestSlots").gameObject;

		slotsContainers = new GameObject[] {
		hotbarSlots, inventorySlots, toolcraftSlots, guncraftSlots, generalcraftSlots, chestSlots
	};

		int slotId = 0;

		foreach (GameObject container in slotsContainers) {
			for (int i = 0; i < container.transform.childCount; i++) {
				items.Add(new Item());
				slots.Add(container.transform.GetChild(i).gameObject);
				slots[slotId].GetComponent<Slot>().id = slotId;

				SlotStateMachine slotStateMachine = slots[slotId].GetComponent<SlotStateMachine>();

				if (i == container.transform.childCount - 1 && (container == slotsContainers[2] || container == slotsContainers[3] || container == slotsContainers[4])) {
					slotStateMachine.SwitchState(slotStateMachine.OutputState);
				}
				else if (container == slotsContainers[0]) { //HotbarSlots
					slotStateMachine.SwitchState(slotStateMachine.HotbarState);
					slotId++;
					continue;
				}
				 else if (container == slotsContainers[1]) // InventorySlots
				{
					slotStateMachine.SwitchState(slotStateMachine.InventoryState);
				} else if (container == slotsContainers[2]) // ToolcraftSlots
				{
				slotStateMachine.SwitchState(slotStateMachine.ToolcrafterState);
					
				} else if (container == slotsContainers[3]) // GuncraftSlots
				{
					slotStateMachine.SwitchState(slotStateMachine.GuncrafterState);
				} else if (container == slotsContainers[4]) // GeneralcraftSlots
				{
					slotStateMachine.SwitchState(slotStateMachine.GeneralcrafterState);
				}
				else if(container == slotsContainers[5]) // ChestSlots
				{
					slotStateMachine.SwitchState(slotStateMachine.ChestState);
                }
				slots[slotId].SetActive(false);
				slotId++;
			}
		}
	}

	public void RemoveItem(int slotNum) {
		// Check if the slot index is within the valid range
		if (slotNum >= 0 && slotNum < items.Count) {
			// Set the item in the specified slot to an empty item or placeholder
			items[slotNum] = new Item();

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
