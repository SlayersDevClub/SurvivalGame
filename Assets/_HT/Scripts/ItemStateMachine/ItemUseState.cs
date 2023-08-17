using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public class ItemUseState : ItemBaseState
{

    public override void EnterState(ItemStateMachine item) {
        
    }
    public override void HandleInput(ItemStateMachine item, InputAction.CallbackContext context) {
        BaseItemTemplate equipItem = ItemDatabase.FetchBaseItemTemplateById(item.inv.items[item.transform.GetComponent<Slot>().id].Id);
        

    }
    public override void OnDrop(ItemStateMachine item, PointerEventData pointerEventData, int slotID, GameObject slot) {
        
    }

}
