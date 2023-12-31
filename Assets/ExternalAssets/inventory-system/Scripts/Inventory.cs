﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class Inventory : MonoBehaviour {

	protected GameObject inventoryPanel;
	protected GameObject slotPanel;

	public GameObject hotbarSlots;
	public GameObject inventorySlots;
	public GameObject toolcraftSlots;
	public GameObject guncraftSlots;
	public GameObject generalcraftSlots;
	public GameObject chestSlots;

	public GameObject toolcraftSlotOutput;
	public GameObject guncraftSlotOutput;
	public GameObject generalcraftSlotOutput;

	private GameObject[] slotsContainers;

	public GameObject inventorySlot;
	public GameObject inventoryItem;

	public List<Item> items = new List<Item>();
	public List<GameObject> slots = new List<GameObject>();	// list of every slot in the inventory across types

	public void Start() {
		ItemDatabase.Initialize();
		inventoryPanel = GameObject.Find("InventoryPanel").gameObject;
		slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;

		// Find parent GameObject for each type of slot
		hotbarSlots = slotPanel.transform.Find("HotbarSlots/Slots").gameObject;
		inventorySlots = slotPanel.transform.Find("InventorySlots/Slots").gameObject;
		toolcraftSlots = slotPanel.transform.Find("ToolcraftSlots/Slots").gameObject;
		guncraftSlots = slotPanel.transform.Find("GuncraftSlots/Slots").gameObject;
		generalcraftSlots = slotPanel.transform.Find("GeneralcraftSlots/Slots").gameObject;
		chestSlots = slotPanel.transform.Find("ChestSlots/Slots").gameObject;
		toolcraftSlotOutput = toolcraftSlots.transform.GetChild(toolcraftSlots.transform.childCount - 1).gameObject;
		guncraftSlotOutput = guncraftSlots.transform.GetChild(guncraftSlots.transform.childCount - 1).gameObject;
		generalcraftSlotOutput = generalcraftSlots.transform.GetChild(generalcraftSlots.transform.childCount - 1).gameObject;

		slotsContainers = new GameObject[] {
			hotbarSlots, inventorySlots, toolcraftSlots, guncraftSlots, generalcraftSlots, chestSlots
		};

		int slotId = 0;
		bool equipSlotAssigned = false;

		// For each container object corresponding to the different types of slots
		foreach (GameObject container in slotsContainers) {
			// Find each child slot in that container
			for (int i = 0; i < container.transform.childCount; i++) {
				items.Add(new Item());
				slots.Add(container.transform.GetChild(i).gameObject);

				try {
					slots[slotId].GetComponent<Slot>().id = slotId;
                } catch {
					continue;
                }

				SlotStateMachine slotStateMachine = slots[slotId].GetComponent<SlotStateMachine>();

				// Setup each slots initial state here
				if (i == container.transform.childCount - 1 && (container == slotsContainers[2] || container == slotsContainers[3] || container == slotsContainers[4])) {
					// If on last slot in the container and it is a crafting slot
					slotStateMachine.SwitchState(slotStateMachine.OutputState);
				} else if (container == slotsContainers[0]) { //HotbarSlots
					// Set 1st hotbar slot to the default equiped slot
                    if (!equipSlotAssigned) {
						slotStateMachine.SwitchState(slotStateMachine.EquipState);
						equipSlotAssigned = true;
                    } else {
						slotStateMachine.SwitchState(slotStateMachine.HotbarState);
					}
				} else if (container == slotsContainers[1]) { // InventorySlots
					slotStateMachine.SwitchState(slotStateMachine.InventoryState);
				} else if (container == slotsContainers[2]) { // ToolcraftSlots
					slotStateMachine.SwitchState(slotStateMachine.ToolcrafterState);
				} else if (container == slotsContainers[3]) { // GuncraftSlots
					slotStateMachine.SwitchState(slotStateMachine.GuncrafterState);
				} else if (container == slotsContainers[4]) { // GeneralcraftSlots
					slotStateMachine.SwitchState(slotStateMachine.GeneralcrafterState);
				} else if(container == slotsContainers[5]) { // ChestSlots
					slotStateMachine.SwitchState(slotStateMachine.ChestState);
                }
				
				slotId++;
			}
		}
	}

	public void RemoveItem(int slotNum, bool removeStack = false) {
		// Check if the slot index is within the valid range
		if (slotNum >= 0 && slotNum < items.Count) {
			// Check if there's an item in the slot
			if (items[slotNum].Id != -1) {
				ItemData data = slots[slotNum].transform.GetChild(0).GetComponent<ItemData>();
				if (data.amount > 0) {
                    if (removeStack) {
						Destroy(slots[slotNum].transform.GetChild(0).gameObject);
                    } else {
						// Decrease the amount of the item if it's stackable
						data.amount--;
					}
					
					ItemData.UpdateItemNumberDisplay(data);
				} else {
					// Remove the item if there's only one left
					items[slotNum] = new Item();
					Destroy(slots[slotNum].transform.GetChild(0).gameObject);
				}
			}
		}

		SlotStateMachine removedFromSlot = slots[slotNum].GetComponent<SlotStateMachine>();

		removedFromSlot.HandleEquip();
	}


	public virtual void AddItem(int id, int slotNum = -1) {
		Debug.Log(id);
		int addedToSlotNum = -2;

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

			addedToSlotNum = slotNum;
		}

		else if (itemToAdd.Stackable && CheckIfItemIsInInventory(itemToAdd)) {
			for (int i = 0; i < items.Count; i++) {
				if (items[i].Id == id) {
					ItemData data = slots[i].transform.GetChild(0).GetComponent<ItemData>();
					data.amount++;

					ItemData.UpdateItemNumberDisplay(data);

					break;
				}
			}
		} else {
			for (int i = 0; i < items.Count; i++) {
				if (items[i].Id == -1) {
					items[i] = itemToAdd;
					GameObject itemObj = Instantiate(inventoryItem);
					itemObj.GetComponent<ItemData>().item = itemToAdd;
					itemObj.GetComponent<ItemData>().slotId = i;
					itemObj.transform.SetParent(slots[i].transform);
					itemObj.transform.localPosition = Vector2.zero;
					itemObj.GetComponent<Image>().sprite = itemToAdd.Sprite;
					itemObj.name = "Item: " + itemToAdd.Title;
					slots[i].name = "Slot: " + itemToAdd.Title;

					addedToSlotNum = i;
					break;
				}
			}
		}
		
		if (addedToSlotNum != -2) {
			SlotStateMachine addedToSlot = slots[addedToSlotNum].GetComponent<SlotStateMachine>();

			addedToSlot.HandleEquip();
		}
	}

	protected bool CheckIfItemIsInInventory(Item item) {
		for (int i = 0; i < items.Count; i++) {
			if (items[i].Id == item.Id) {
				return true;
			}
		}

		return false;
	}

}
