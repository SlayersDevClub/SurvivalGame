using UnityEngine.InputSystem;
using UnityEngine;

/*
 * Player state when the player has no menus open and can move.
 * The default player state.
 */
public class PlayerMovingState : PlayerBaseState {

    public override void EnterState(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("Move");

        // Prevent the cursor from moving, so mouse movement controls where the player looks instead.
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if (context.started) {
            if (context.action.name == TagManager.PAUSE_ACTION) {
                player.SwitchState(player.PausedState);
            } else if (context.action.name == TagManager.INTERACT_ACTION) {
                if (player.pickedUp) {
                    player.pickedUp = false;
                } else {
                    player.SwitchState(player.InteractingState);
                }
            }
        }
    }

}

