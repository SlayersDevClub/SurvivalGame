using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using System;
using Photon.Pun;
public abstract class SlotBaseState {

    public abstract void EnterState(SlotStateMachine item);
    public abstract void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context);
    public abstract void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context);

    public virtual void OnDrop(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        ItemData droppedSlot = item.player.invItemDragging;
        int cameFromSlotNum = droppedSlot.slotId;

        HandleDropAndSwap(item, pointerEventData, slotID, slot);

        if (item.inv.slots[cameFromSlotNum].TryGetComponent<SlotStateMachine>(out SlotStateMachine droppedSlotStateMachine)) {
            if (droppedSlotStateMachine.GetCurrentState() as SlotOutputState != null) {
                ClearCraftersSlots(item);
            }
        }

        TryCraftTool(item);
        TryCraftGun(item);
        TryGeneralCraft(item);
    }

    public virtual void HandleDropAndSwap(SlotStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        ItemData droppedItem = item.player.invItemDragging;

        Slot thisSlot = slot.GetComponent<Slot>();
        SFXManager.instance.PlaySlotIn();

        //Dropping into same slot
        if (droppedItem.slotId == slotID) {

        }

        //Dropping into empty slot
        else if (item.inv.items[slotID].Id == -1) {
            item.inv.items[droppedItem.slotId] = new Item();
            item.inv.items[slotID] = droppedItem.item;
            droppedItem.slotId = thisSlot.id;
        }
        //Dropping into occupied slot
        else {

            Transform itemTransform = thisSlot.transform.GetChild(0);
            ItemData slotItemData = itemTransform.GetComponent<ItemData>();
            if (slotItemData.item.Id == droppedItem.item.Id && slotItemData.item.Stackable) {
                droppedItem.amount += slotItemData.amount + 1;
                item.inv.RemoveItem(slotID, true);


                item.inv.items[droppedItem.slotId] = new Item();
                item.inv.items[slotID] = droppedItem.item;
                droppedItem.slotId = thisSlot.id;

                droppedItem.transform.SetParent(thisSlot.transform);
                droppedItem.transform.position = thisSlot.transform.position;

                ItemData.UpdateItemNumberDisplay(droppedItem);

            } else if (itemTransform != null) {
                slotItemData.slotId = droppedItem.slotId;
                Item newItem = new Item();
                newItem.Id = slotItemData.item.Id != -1 ? slotItemData.item.Id : -1;
                item.inv.items[droppedItem.slotId] = newItem;

                droppedItem.slotId = slotID;
                droppedItem.transform.SetParent(thisSlot.transform);
                droppedItem.transform.position = thisSlot.transform.position;
            } else {
                Debug.LogWarning("No child transform found in the slot");
            }


        }

        droppedItem.StopItemMouseLock();
        item.player.invItemDragging = null;
        HandleIfEquipChanges(item);
    }



    public virtual void HandleIfEquipChanges(SlotStateMachine slot) {
        BaseItemTemplate itemToEquip = ItemDatabase.FetchBaseItemTemplateById(slot.inv.items[slot.player.equipItemSlot].Id);
        BaseItemTemplate curEquipedItem = slot.player.equipItem;

        if (itemToEquip == curEquipedItem) {
            return;
        }

        if (itemToEquip != curEquipedItem && GetEquipGameObject(slot) != null) {
            Unequip(slot);
        }

        slot.player.equipItem = itemToEquip;
        Equip(slot);
    }

    public void Unequip(SlotStateMachine slot) {
        GameObject equipedItem = GetEquipGameObject(slot);

        equipedItem.GetComponentInParent<HandRigConnector>().ResetHands();
        GameObject.Destroy(equipedItem);

        SFXManager.instance.PlaySlotOut();
    }

    public GameObject GetEquipGameObject(SlotStateMachine slot) {
        if (slot.player.transform.Find("Model/ItemHolder/Resource").transform.childCount > 0) {
            return (slot.player.transform.Find("Model/ItemHolder/Resource").GetChild(0).gameObject);
        } else if (slot.player.transform.Find("Model/ItemHolder/Gun").transform.childCount > 0) {
            return (slot.player.transform.Find("Model/ItemHolder/Gun").GetChild(0).gameObject);
        } else if (slot.player.transform.Find("Model/ItemHolder/Tool").transform.childCount > 0) {
            return (slot.player.transform.Find("Model/ItemHolder/Tool").GetChild(0).gameObject);
        } else if (slot.player.transform.Find("Model/ItemHolder/Structure").transform.childCount > 0) {
            return (slot.player.transform.Find("Model/ItemHolder/Structure").GetChild(0).gameObject);
        } else if (slot.player.transform.Find("Model/ItemHolder/Consumable").transform.childCount > 0) {
            return (slot.player.transform.Find("Model/ItemHolder/Consumable").GetChild(0).gameObject);
        } else {
            return null;
        }
    }

    private void MakeMultiplayerViewable(GameObject gameObj) {
        gameObj.AddComponent<PhotonView>();
        gameObj.AddComponent<PhotonTransformView>();
    }

    public void Equip(SlotStateMachine slot) {
        ResourceTemplate resource = slot.player.equipItem as ResourceTemplate;
        GunTemplate gun = slot.player.equipItem as GunTemplate;
        ToolTemplate tool = slot.player.equipItem as ToolTemplate;
        StructureTemplate structure = slot.player.equipItem as StructureTemplate;
        ConsumableTemplate consumable = slot.player.equipItem as ConsumableTemplate;

        GameObject itemHeld;
        GameObject original;


        if (resource != null) {
            itemHeld = GameObject.Instantiate(slot.player.equipItem.prefab, slot.player.transform.Find("Model/ItemHolder/Resource").transform);

            SetEquippedLayer(itemHeld);

            itemHeld.GetComponent<Rigidbody>().useGravity = false;
            itemHeld.GetComponent<Rigidbody>().isKinematic = true;
            itemHeld.GetComponent<Collider>().enabled = false;
        } else if (gun != null) {
            original = GameObject.Find("CustomItems/CustomGun" + slot.player.equipItem.Id);
            itemHeld = GameObject.Instantiate(original, slot.player.transform.Find("Model/ItemHolder/Gun").transform);

            SetEquippedLayer(itemHeld);

            itemHeld.GetComponent<GunUsable>().Setup();
            //itemHeld.GetComponent<GunUsable>().enabled = true;
        } else if (tool != null) {
            original = GameObject.Find("CustomItems/CustomTool" + slot.player.equipItem.Id);
            itemHeld = GameObject.Instantiate(original, slot.player.transform.Find("Model/ItemHolder/Tool").transform);

            SetEquippedLayer(itemHeld);

            itemHeld.transform.localPosition = new Vector3(0, 0.25f, 0);

            // Check if the itemHeld has the PickaxeUsable component
            PickaxeUsable pickaxeUsable = itemHeld.GetComponent<PickaxeUsable>();
            if (pickaxeUsable != null) {
                pickaxeUsable.Setup();
            } else {
                // Check if the itemHeld has the AxeUsable component
                AxeUsable axeUsable = itemHeld.GetComponent<AxeUsable>();
                if (axeUsable != null) {
                    axeUsable.Setup();
                } else {
                    // Check if the itemHeld has the HammerUsable component
                    HammerUsable hammerUsable = itemHeld.GetComponent<HammerUsable>();
                    if (hammerUsable != null) {
                        //hammerUsable.Setup();
                    } else {
                        // Handle the case where none of the specific usable components are found
                        Debug.LogWarning("No usable component found on toolTranny.");
                    }
                }
            }
        } else if (structure != null) {
            itemHeld = GameObject.Instantiate(slot.player.equipItem.prefab, slot.player.transform.Find("Model/ItemHolder/Structure").transform);

            itemHeld.layer = LayerMask.NameToLayer(TagManager.PLACEABLE_LAYER); ;
        } else if (consumable != null) {
            itemHeld = GameObject.Instantiate(slot.player.equipItem.prefab, slot.player.transform.Find("Model/ItemHolder/Consumable").transform);

            SetEquippedLayer(itemHeld);

            itemHeld.GetComponent<ConsumableUsable>().Setup();
        } else {
            Debug.Log("Could not find item to equip from item.player.equipItem");
            return;
        }

        MakeMultiplayerViewable(itemHeld);
    }

    private void SetEquippedLayer(GameObject parentItem) {
        foreach (Transform child in parentItem.GetComponentsInChildren<Transform>())
            child.gameObject.layer = LayerMask.NameToLayer("Equipped");
    }

    public void ClearCraftersSlots(SlotStateMachine item) {
        ClearCrafterSlots(item, item.player.inv.toolcraftSlots);
        ClearCrafterSlots(item, item.player.inv.guncraftSlots);
        ClearCrafterSlots(item, item.player.inv.generalcraftSlots);
    }

    private void ClearCrafterSlots(SlotStateMachine item, GameObject crafter) {
        foreach (Transform slot in crafter.transform) {
            Slot curSlot = slot.GetComponent<Slot>();

            if (curSlot != null) {
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
                Debug.Log("LOOKING FOR");

                toolParts.Add(ItemDatabase.FetchBaseItemTemplateById(item.inv.items[slotItem.GetComponent<Slot>().id].Id));


                try {
                    Debug.Log(toolParts[0]);
                    if (toolParts[0] is BaseItemTemplate) {
                        Debug.Log("ASDF");
                    }
                    if (toolParts[0] is PickaxeHandleTemplate) {
                        Debug.Log("ASDF");
                    }
                    if (toolParts[0] as PickaxeHandleTemplate != null) {
                        Debug.Log("ASDF");
                    }
                    Debug.Log(toolParts[0].Id);
                    Debug.Log(toolParts[1].Id);
                } catch {

                }
            }
        }

        BaseItemTemplate maybeNewTool = CraftingBrain.AttemptBuildTool(toolParts);
        ToolTemplate newTool = maybeNewTool as ToolTemplate;

        if (newTool != null) {
            Debug.Log("NOT NUUILL");
            //TO DO TODO 
            /*JsonDataManager.AddBaseItemTemplateToJson(newTool);
            ItemDatabase.Initialize();*/
            ItemDatabase.AddBaseItemTemplate(newTool);
            JsonDataManager.AddBaseItemTemplateToJson(newTool);


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
            ItemDatabase.AddBaseItemTemplate(newGun);
            JsonDataManager.AddBaseItemTemplateToJson(newGun);

            Slot outputSlot = item.inv.guncraftSlotOutput.GetComponent<Slot>();
            if (outputSlot != null) {
                item.inv.AddItem(Int16.Parse(newGun.Id), outputSlot.GetComponent<Slot>().id);
            }

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

            if (slotItem != null) {
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
                if (slotStateMachine.GetCurrentState() as SlotOutputState != null) {
                    item.inv.RemoveItem(slotStateMachine.GetComponent<Slot>().id);
                }
            }
        }

        // Perform your other actions here
    }

}
