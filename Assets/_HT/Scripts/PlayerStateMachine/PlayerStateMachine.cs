using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerStateMachine : MonoBehaviour
{
    PlayerBaseState currentState;
    public PlayerPausedState PausedState = new PlayerPausedState();
    public PlayerMovingState MovingState = new PlayerMovingState();
    public PlayerInteractingState InteractingState = new PlayerInteractingState();
    public PlayerGunCraftState GunCraftState = new PlayerGunCraftState();
    public PlayerChestState ChestState = new PlayerChestState();
    public PlayerCrafterState CrafterState = new PlayerCrafterState();
    public PlayerInventoryState InventoryState = new PlayerInventoryState();
    public PlayerToolcraftState ToolCraftState = new PlayerToolcraftState();

    public PlayerInputReader pir;
    public Transform playerTransform;

    public Inventory inv;
    public GameObject inventoryPanel;
    public GameObject slotPanel;
    public GameObject inventorySlot;

    public UIManager ui;

    public int equipItemSlot;
    public BaseItemTemplate equipItem;
    public ItemData invItemDragging;

    public bool pickedUp = false;

    public bool respawning = false;
    void Start() {
        pir = GetComponent<PlayerInputReader>();
        inventoryPanel = transform.Find("PlayerUI/InventoryPanel").gameObject;
        slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;

        currentState = MovingState;
        currentState.EnterState(this);
    }

    public void HandleInput(InputAction.CallbackContext context) {
        if (context.started) {
            currentState.HandleInput(this, context);
        }
    }

    public void SwitchState(PlayerBaseState state) {
        currentState = state;
        currentState.EnterState(this);
    }
}
