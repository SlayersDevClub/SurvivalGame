using System.Collections.Generic;
using UnityEngine;
using System;
using System.Linq;
[CreateAssetMenu]
public class Inventory : ScriptableObject {
    public GameObject inventoryPanel;

    public List<HotbarSlot> hotbarItemSlots = new List<HotbarSlot>();
    public List<ItemSlot> inventoryItemSlots = new List<ItemSlot>();
    public List<ToolcrafterSlot> toolcrafterItemSlots = new List<ToolcrafterSlot>();
    public List<GuncrafterSlot> guncrafterItemSlots = new List<GuncrafterSlot>();

    public OutputSlot toolcrafterOutputSlot, guncrafterOutputSlot;

    public GameObject currentDraggedItem;
    public GameObject currentHeldItem;
    public GameObject inventoryItemPrefab;

    public int equipItemSlot;

    public Dictionary<Type, GameObject> itemHolders = new Dictionary<Type, GameObject>();
    public GameObject structureHolder, gunHolder, resourceHolder, toolHolder, defaultHolder;

    //Items ID (key) and their quantity (value) in the inventory
    public IntIntRuntimeDict itemsInInventory;
    public ItemDatabase itemDatabase;
    public CraftingBrain craftingBrain;

    public void SetItemInInventory(int key, int value) {
        if (itemsInInventory.Contains(key)) {
            int currentItemAmount = itemsInInventory.GetValue(key);
            itemsInInventory.Add(key, currentItemAmount + value);
        } else {
            itemsInInventory.Add(key, value);
        }

        //craftingBrain.UpdateCraftableItemsInTable(itemsInInventory);
    }

    public bool AddItem(int itemID) {
        BaseItemTemplate itemToAdd = itemDatabase.FetchBaseItemTemplateById(itemID);
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
            GameObject itemAdded = itemDatabase.FetchItemGameObject(itemToAdd);
            
            itemAdded.GetComponent<ItemData>().item = itemToAdd;

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
