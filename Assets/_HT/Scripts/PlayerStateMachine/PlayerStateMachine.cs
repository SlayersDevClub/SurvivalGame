using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerStateMachine : MonoBehaviour {

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
    public GameObject inventoryPanel;   // GameObject that holds the different elements of the player's inventory
    public GameObject slotPanel;        // GameObject which stores different types of inventory slots
    public GameObject inventorySlot;    // Stores the Slot prefab

    public UIManager ui;

    public int equipItemSlot;
    public BaseItemTemplate equipItem;

    public bool pickedUp = false;

    public bool respawning = false;

    void Start() {
        pir = GetComponent<PlayerInputReader>();
        inventoryPanel = transform.Find("PlayerUI/InventoryPanel").gameObject;
        slotPanel = inventoryPanel.transform.Find("SlotPanel").gameObject;

        // MovingState is default state
        currentState = MovingState;
        currentState.EnterState(this);
    }

    /*
     * Change the current state the player is in.
     */
    public void SwitchState(PlayerBaseState state) {
        currentState = state;
        currentState.EnterState(this);
    }

    /*
     * Recieve player inputs. Inputs can differ in functionality depending on the current state.
     */
    public void HandleInput(InputAction.CallbackContext context) {
        if (context.started) {
            currentState.HandleInput(this, context);
        }
    }
}
