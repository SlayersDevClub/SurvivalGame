using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public class ItemStateMachine : MonoBehaviour
{
    ItemBaseState currentState;
    public ItemDroppedState DroppedState = new ItemDroppedState();
    public ItemHotbarState HotbarState = new ItemHotbarState();
    public ItemIdleState IdleState = new ItemIdleState();
    public ItemUseState UseState = new ItemUseState();
    public ItemEquipState EquipState = new ItemEquipState();

    public Inventory inv;
    public Item thisItem;
    private void Start() {
        thisItem = GetComponent<ItemData>().item;
        inv = GameObject.Find("PlayerUI/Inventory").GetComponent<Inventory>();

        currentState = IdleState;
        currentState.EnterState(this);
    }

    public void HandleInput(InputAction.CallbackContext context) {
        
    }

    public void OnDrop(PointerEventData pointerEventData, int slotID, GameObject slot) {
        currentState.OnDrop(this, pointerEventData, slotID, slot);
    }

    public void SwitchState(ItemBaseState state) {
        if(state != currentState) {
            currentState = state;
            state.EnterState(this);
        }

    }
}
