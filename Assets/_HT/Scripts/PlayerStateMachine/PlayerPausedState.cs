using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;

public class PlayerPausedState : PlayerBaseState
{
    public override void EnterState(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        player.ui.ShowPlayerInventory(true);
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        Debug.Log("entered pause state");
        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.ui.ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if (context.started)
        {
            if (context.action.name == TagManager.PAUSE_ACTION)
            {
                player.ui.ShowPlayerInventory(false);
                if (player.pir.playerInput.currentControlScheme == "Gamepad")
                {
                    player.ui.ShowControllerCursor(false);
                }

                player.SwitchState(player.MovingState);
            }
        }

    }
}
