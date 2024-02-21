using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerStateMachine : MonoBehaviour
{
    PlayerBaseState currentState;
    public PlayerPausedState PausedState = new PlayerPausedState();
    public PlayerMovingState MovingState = new PlayerMovingState();
    public PlayerInteractingState InteractingState = new PlayerInteractingState();
    public PlayerInventoryState InventoryState = new PlayerInventoryState();
    public PlayerToolcraftState ToolCraftState = new PlayerToolcraftState();

    public PlayerInputReader pir;
    public UIManager ui;
    public Inventory inventory;

    public Transform playerTransform;
    public BaseItemTemplate equipItem;
    public ItemData invItemDragging;

    public bool isInteracting = false;
    public bool respawning = false;

    void Start() {
        // MovingState is default starting state
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
