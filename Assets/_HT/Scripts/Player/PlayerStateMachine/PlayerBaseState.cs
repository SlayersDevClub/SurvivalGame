using UnityEngine.InputSystem;

public abstract class PlayerBaseState {

    /*
     * Change the current state the player is in.
     */
    public abstract void EnterState(PlayerStateMachine player);

    /*
     * Recieve player inputs. Inputs can differ in functionality depending on the current state.
     */
    public abstract void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context);
}
