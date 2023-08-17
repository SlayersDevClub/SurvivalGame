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
        inv = GameObject.Find("PlayerUI/Inventory").GetComponent<Inventory>();
        player = GameObject.Find("Player_1").GetComponent<PlayerStateMachine>();

    }

    public void HandleInput(InputAction.CallbackContext context) {
        currentState.HandleInput(this, context);
    }

    public void OnDrop(PointerEventData pointerEventData, int slotID, GameObject slot) {
        currentState.OnDrop(this, pointerEventData, slotID, slot);
    }

    public void SwitchState(SlotBaseState state) {
        currentState = state;
        currentState.EnterState(this);
    }
}

