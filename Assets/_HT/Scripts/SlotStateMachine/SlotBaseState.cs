using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
public abstract class SlotBaseState {

    public abstract void EnterState(SlotStateMachine item);

    public abstract void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot);

    public abstract void HandleInput(SlotStateMachine item, InputAction.CallbackContext context);


    public virtual void HandleDropAndSwap(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        ItemData droppedItem = pointerEventData.pointerDrag.GetComponent<ItemData>(); // Assuming item is the dragged object
        Slot thisSlot = slot.GetComponent<Slot>();

        if (droppedItem.slotId == slotID) {
            Debug.Log("Dropped in the same slot");
            return; // Don't proceed with swapping
        }

        if (item.inv.items[slotID].Id == -1) {
            item.inv.items[droppedItem.slotId] = new Item();
            item.inv.items[slotID] = droppedItem.item;
            droppedItem.slotId = thisSlot.id;

            Debug.Log("EMPTY SLOT");
        } else {
            Transform itemTransform = thisSlot.transform.GetChild(0);

            if (itemTransform != null) {
                ItemData slotItemData = itemTransform.GetComponent<ItemData>();
                slotItemData.slotId = droppedItem.slotId;

                // Create a new item to swap and copy properties
                Item newItem = new Item();
                newItem.Id = slotItemData.item.Id != -1 ? slotItemData.item.Id : -1;
                // Copy other properties similarly

                item.inv.items[droppedItem.slotId] = newItem;

                // Swap the items
                newItem = new Item();
                newItem.Id = droppedItem.item.Id != -1 ? droppedItem.item.Id : -1;
                // Copy other properties similarly

                item.inv.items[slotID] = newItem;

                // Update positions and parent transforms
                itemTransform.SetParent(item.inv.slots[droppedItem.slotId].transform);
                itemTransform.position = item.inv.slots[droppedItem.slotId].transform.position;
            } else {
                Debug.LogWarning("No child transform found in the slot");
            }

            droppedItem.slotId = slotID;
            droppedItem.transform.SetParent(thisSlot.transform);
            droppedItem.transform.position = thisSlot.transform.position;

            Debug.Log("SWAPPED");
        }

        HandleIfEquipChanges(item);
    }


    public virtual void HandleIfEquipChanges(SlotStateMachine item) {
        
        BaseItemTemplate equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.player.equipItemSlot].Id);

        if (equipItem != item.player.equipItem){
            Unequip(item);

            item.player.equipItem = equipItem;

            Equip(item);
        }
        else if(equipItem == item.player.equipItem && GetEquipGameObject(item) == null) {
            Equip(item);
        }
    }
    public void Unequip(SlotStateMachine item) {
        if (item.player.transform.Find("Model/ItemHolder/Resource").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Resource").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Gun").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Gun").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Tool").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Tool").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Structure").transform.childCount > 0) {
            GameObject.Destroy(item.player.transform.Find("Model/ItemHolder/Structure").GetChild(0).gameObject);
        }
    }

    public GameObject GetEquipGameObject(SlotStateMachine item) {
        if (item.player.transform.Find("Model/ItemHolder/Resource").transform.childCount > 0) {
            return (item.player.transform.Find("Model/ItemHolder/Resource").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Gun").transform.childCount > 0) {
            return  (item.player.transform.Find("Model/ItemHolder/Gun").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Tool").transform.childCount > 0) {
            return (item.player.transform.Find("Model/ItemHolder/Tool").GetChild(0).gameObject);
        } else if (item.player.transform.Find("Model/ItemHolder/Structure").transform.childCount > 0) {
            return  (item.player.transform.Find("Model/ItemHolder/Structure").GetChild(0).gameObject);
        } else {
            return null;
        }
    }

    public void Equip(SlotStateMachine item) {
        ResourceTemplate resource = item.player.equipItem as ResourceTemplate;
        GunTemplate gun = item.player.equipItem as GunTemplate;
        ToolTemplate tool = item.player.equipItem as ToolTemplate;
        StructureTemplate structure = item.player.equipItem as StructureTemplate;

        if (resource != null) {
            
            GameObject.Instantiate(item.player.equipItem.prefab, item.player.transform.Find("Model/ItemHolder/Resource").transform);
        } else if (gun != null) {
            Debug.Log("CustomGun" + item.player.equipItem.Id);
            GameObject original = GameObject.Find("CustomItems/CustomGun" + item.player.equipItem.Id);
            original.layer = LayerMask.NameToLayer("Default");

            foreach (Transform child in original.transform) {
                child.gameObject.layer = LayerMask.NameToLayer("Default");
                foreach (Transform kid in child.transform) {
                    kid.gameObject.layer = LayerMask.NameToLayer("Default");
                }
            }

            GameObject.Instantiate(original, item.player.transform.Find("Model/ItemHolder/Gun").transform);
        } else if (tool != null) {
            GameObject original = GameObject.Find("CustomItems/CustomTool" + item.player.equipItem.Id);
            original.layer = LayerMask.NameToLayer("Default");

            foreach (Transform child in original.transform) {
                child.gameObject.layer = LayerMask.NameToLayer("Default");
                foreach (Transform kid in child.transform) {
                    kid.gameObject.layer = LayerMask.NameToLayer("Default");
                }
            }
            GameObject.Instantiate(original, item.player.transform.Find("Model/ItemHolder/Tool").transform);
        } else if (structure != null) {
            GameObject.Instantiate(item.player.equipItem.prefab, item.player.transform.Find("Model/ItemHolder/Structure").transform);
        }
    }

    public void ClearCraftersSlots(SlotStateMachine item) {
        ClearCrafterSlots(item, item.player.inv.toolcraftSlots);
        ClearCrafterSlots(item, item.player.inv.guncraftSlots);
        ClearCrafterSlots(item, item.player.inv.generalcraftSlots);
    }

    private void ClearCrafterSlots(SlotStateMachine item, GameObject crafter) {
        foreach (Transform slot in crafter.transform) {
            Slot curSlot = slot.GetComponent<Slot>();

            if(curSlot != null) {
                item.player.inv.RemoveItem(curSlot.id);
            }
        }
    }

    public bool TryCraftTool(SlotStateMachine item) {
        //item.inv.RemoveItem(item.inv.toolcraftSlots.transform.GetChild(item.inv.toolcraftSlots.transform.childCount - 1).GetComponent<Slot>().id);


        List<BaseItemTemplate> toolParts = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.toolcraftSlots.transform) {
            GameObject toolSlot = slotTransform.gameObject;

            Slot slotItem = toolSlot.GetComponent<Slot>();

            if (slotItem != null) {
                toolParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[slotItem.GetComponent<Slot>().id].Id));
            }
        }

        BaseItemTemplate maybeNewTool = CraftingBrain.AttemptBuildTool(toolParts);
        ToolTemplate newTool = maybeNewTool as ToolTemplate;

        if (newTool != null) {

            JsonDataManager.AddBaseItemTemplateToJson(newTool);
            ItemDatabase.Initialize(item.player.data, item.player.recipes);
            //Add item to inventory by item ID and slot number to add to
            Slot outputSlot = item.inv.toolcraftSlotOutput.GetComponent<Slot>();

            if (outputSlot != null) {
                item.inv.AddItem(Int16.Parse(newTool.Id), outputSlot.GetComponent<Slot>().id);
            }

            return true;
        } else {
            ClearOutPutSlots(item);
            return false;
        }
    }

    public bool TryCraftGun(SlotStateMachine item) {
        List<BaseItemTemplate> gunParts = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.guncraftSlots.transform) {
            GameObject gunSlot = slotTransform.gameObject;

            Slot slotItem = gunSlot.GetComponent<Slot>();

            if (slotItem != null) {
                gunParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[slotItem.GetComponent<Slot>().id].Id));
            }
        }

        BaseItemTemplate maybeNewGun = CraftingBrain.AttemptBuildGun(gunParts);
        GunTemplate newGun = maybeNewGun as GunTemplate;

        if (newGun != null) {
            JsonDataManager.AddBaseItemTemplateToJson(maybeNewGun);
            ItemDatabase.Initialize(item.player.data, item.player.recipes);
            item.inv.AddItem(Int16.Parse(newGun.Id),item.inv.guncraftSlotOutput.GetComponent<Slot>().id);

            return true;
        } else {
            ClearOutPutSlots(item);
            return false;
        }
    }

    public bool TryGeneralCraft(SlotStateMachine item) {
        List<BaseItemTemplate> ingredients = new List<BaseItemTemplate>();

        foreach (Transform slotTransform in item.inv.generalcraftSlots.transform) {
            GameObject craftSlot = slotTransform.gameObject;

            Slot slotItem = craftSlot.GetComponent<Slot>();

            if(slotItem != null) {
                ingredients.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[craftSlot.GetComponent<Slot>().id].Id));
            }

        }

        BaseItemTemplate output = CraftingBrain.AttemptCraft(ingredients);

        if (output != null) {
            item.inv.AddItem(Int16.Parse(output.Id), item.inv.generalcraftSlotOutput.GetComponent<Slot>().id);
            return true;
        } else {
            ClearOutPutSlots(item);
            return false;
        }
    }

    private void ClearOutPutSlots(SlotStateMachine item) {
        ClearOutputSlot(item, item.inv.toolcraftSlots);
        ClearOutputSlot(item, item.inv.guncraftSlots);
        ClearOutputSlot(item, item.inv.generalcraftSlots);
    }

    private void ClearOutputSlot(SlotStateMachine item, GameObject outputToClear) {
        int childCount = outputToClear.transform.childCount;

        for (int i = childCount - 1; i >= 0; i--) {
            Transform childTransform = outputToClear.transform.GetChild(i);
            SlotStateMachine slotStateMachine = childTransform.GetComponent<SlotStateMachine>();

            if (slotStateMachine != null) {
                if(slotStateMachine.GetCurrentState() as SlotOutputState != null) {
                    item.inv.RemoveItem(slotStateMachine.GetComponent<Slot>().id);
                }
                // You can perform additional actions here
            }
        }

        // Perform your other actions here
    }

}
