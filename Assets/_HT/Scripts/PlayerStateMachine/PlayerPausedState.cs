using UnityEngine.InputSystem;
using UnityEngine;

/*
 * Player state when the player issues a pause action.
 * TODO: Change -> Currently set to open the player's inventory, just like the PlayerInventoryState because no pause menu implemented so far.
 */
public class PlayerPausedState : PlayerBaseState {

    public override void EnterState(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        player.ui.ShowPlayerInventory(true);

        // Unlock the cursor so it can be used in the now opened menu.
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.ui.ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if (context.started) {
            if (context.action.name == TagManager.PAUSE_ACTION) {
                player.ui.ShowPlayerInventory(false);

                if (player.pir.playerInput.currentControlScheme == "Gamepad") {
                    player.ui.ShowControllerCursor(false);
                }

                player.SwitchState(player.MovingState);
            }
        }

    }
}
