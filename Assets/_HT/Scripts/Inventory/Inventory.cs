using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.UI;
using System.Linq;

public class Inventory : MonoBehaviour {
    public GameObject inventoryUI, inventoryItemSlotsParent, hotbarItemSlotsParent, toolcrafterItemSlotsParent, guncrafterItemSlotsParent;

    public List<HotbarSlot> hotbarItemSlots = new List<HotbarSlot>();
    public List<ItemSlot> inventoryItemSlots = new List<ItemSlot>();
    public List<ToolcrafterSlot> toolcrafterItemSlots = new List<ToolcrafterSlot>();
    public List<GuncrafterSlot> guncrafterItemSlots = new List<GuncrafterSlot>();

    public OutputSlot toolcrafterOutputSlot, guncrafterOutputSlot, generalcrafterOutputSlot;

    public GameObject currentDraggedItem;
    public GameObject currentHeldItem;
    public GameObject inventoryItemPrefab;

    public int equipItemSlot;

    public Dictionary<Type, GameObject> itemHolders = new Dictionary<Type, GameObject>();
    public GameObject structureHolder, gunHolder, resourceHolder, toolHolder, defaultHolder;

    //Items ID (key) and their quantity (value) in the inventory
    private readonly Dictionary<int, int> itemsInInventory = new Dictionary<int, int>();

    public void SetItemInInventory(int key, int value) {
        if (itemsInInventory.ContainsKey(key)) {
            itemsInInventory[key] += value;
        } else {
            itemsInInventory.Add(key, value);
        }

        CraftingBrain.UpdateCraftableItemsInTable(itemsInInventory);
    }

    public int GetItemInInventory(int key) {
        int result = 0;

        if (itemsInInventory.ContainsKey(key)) {
            result = itemsInInventory[key];
        }

        return result;
    }

    public void RemoveItemInInventory(int key, int value) {
        if (itemsInInventory.ContainsKey(key)) {
            // Subtract the specified value from the existing value
            itemsInInventory[key] = Math.Max(0, itemsInInventory[key] - value);

            // Optionally, you may want to handle the case where the value becomes zero or negative
            if (itemsInInventory[key] == 0) {
                // Handle the case where the value becomes zero
            }
        } else {
            // Handle the case where the key doesn't exist
        }
    }


    private void Start() {
        ItemDatabase.Initialize();

        LocateInventoryItemSlots();
        LocateHotbarItemSlots();
        LocateToolcrafterItemSlots();
        LocateGuncrafterItemSlots();

        SetupItemHolders();
        //Equip first slot on game start
        EquipSlot(0);
    }
    private void SetupItemHolders() {
        itemHolders[typeof(StructureTemplate)] = structureHolder;
        itemHolders[typeof(GunTemplate)] = gunHolder;
        itemHolders[typeof(ResourceTemplate)] = resourceHolder;
        itemHolders[typeof(ToolTemplate)] = toolHolder;
    }

    private void LocateGuncrafterItemSlots() {
        guncrafterItemSlots = guncrafterItemSlotsParent.GetComponentsInChildren<GuncrafterSlot>().ToList();
        guncrafterOutputSlot = guncrafterItemSlotsParent.GetComponentInChildren<GunOutputSlot>();
    }

    private void LocateToolcrafterItemSlots() {
        toolcrafterItemSlots = toolcrafterItemSlotsParent.GetComponentsInChildren<ToolcrafterSlot>().ToList();
        toolcrafterOutputSlot = toolcrafterItemSlotsParent.GetComponentInChildren<ToolOutputSlot>();
    }

    private void LocateHotbarItemSlots() {
        hotbarItemSlots = hotbarItemSlotsParent.GetComponentsInChildren<HotbarSlot>().ToList();

    }

    private void LocateInventoryItemSlots() {
        inventoryItemSlots = inventoryItemSlotsParent.GetComponentsInChildren<ItemSlot>().ToList();
    }

    public bool AddItem(int itemID) {
        BaseItemTemplate itemToAdd = ItemDatabase.FetchBaseItemTemplateById(itemID);
        ItemSlot slotAddingTo = null;

        if(itemToAdd.stackable && CheckIfItemIsInInventory(itemID)) {
            //TO DO
            slotAddingTo = FindFirstEmptySlot();
        } else {
            slotAddingTo = FindFirstEmptySlot();
        }

        //Inventory is full if there is no slot to add to
        if(slotAddingTo == null) {
            return false;
        }
        //Otherwise add item to that slot
        else {
            GameObject itemAdded = ItemDatabase.instance.FetchItemGameObject(itemToAdd);
            
            itemAdded.GetComponent<ItemData>().item = itemToAdd;
            itemAdded.transform.parent = inventoryUI.transform;

            ItemSlot slotToAddTo = slotAddingTo.GetComponent<ItemSlot>();
            slotToAddTo.PutItemInSlot(itemAdded);
            //Add single item to key
            SetItemInInventory(itemID, 1);

            return true;
        }

        ItemSlot FindFirstEmptySlot() {
            ItemSlot firstEmptySlot = null;

            //First check hotbar slots for empty slot
            foreach (HotbarSlot hotbarSlot in hotbarItemSlots) {
                if (hotbarSlot.itemInSlot == null) {
                    firstEmptySlot = hotbarSlot;
                    return firstEmptySlot;
                }
            }
            //Then check inventory slots for empty slot
            foreach (ItemSlot itemSlot in inventoryItemSlots) {
                if (itemSlot.itemInSlot == null) {
                    firstEmptySlot = itemSlot;
                    return firstEmptySlot;
                }
            }

            return firstEmptySlot;
        }
    }

    public void RemoveItem(int slotNum, bool removeStack = false) {

    }

    public bool CheckIfItemIsInInventory(int itemID) {
        return true;
    }

    private bool SlotEmptyOrSameStackableItem(ItemSlot itemSlot) {
        return true;
    }

    public void EquipSlot(int slotNum) {
        hotbarItemSlots[equipItemSlot].UnsetAsEquipSlot();
        hotbarItemSlots[slotNum].SetAsEquipSlot();

        equipItemSlot = slotNum;
    }

}
