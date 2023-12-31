using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;

public class SlotStateMachine : MonoBehaviour {
    SlotBaseState currentState;
    public SlotChestState ChestState = new SlotChestState();
    public SlotGuncrafterState GuncrafterState = new SlotGuncrafterState();
    public SlotGeneralcrafterState GeneralcrafterState = new SlotGeneralcrafterState();
    public SlotHotbarState HotbarState = new SlotHotbarState();
    public SlotInventoryState InventoryState = new SlotInventoryState();
    public SlotToolcrafterState ToolcrafterState = new SlotToolcrafterState();
    public SlotEquipState EquipState = new SlotEquipState();
    public SlotUseState UseState = new SlotUseState();
    public SlotOutputState OutputState = new SlotOutputState();
    public SlotDropState DropState = new SlotDropState();

    public Inventory inv;
    public PlayerStateMachine player;

    private void Start() {
        inv = transform.root.Find("PlayerUI/Inventory").GetComponent<Inventory>();
        player = transform.root.GetComponent<PlayerStateMachine>();

    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        currentState.StartHandleInput(this, context);
    }
    
    public void EndHandleInput(InputAction.CallbackContext context) {
        currentState.EndHandleInput(this, context);
    }

    public void OnDrop(PointerEventData pointerEventData, int slotID, GameObject slot) {
        currentState.OnDrop(this, pointerEventData, slotID, slot);
    }

    public void SwitchState(SlotBaseState state) {
        currentState = state;
        currentState.EnterState(this);
    }

    public void HandleEquip() {
        currentState.HandleIfEquipChanges(this);
    }

    public SlotBaseState GetCurrentState() {
        return currentState;
    }
}

