using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;

public class PlayerMovingState : PlayerBaseState
{
    public override void EnterState(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("Move");
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if (context.started) {
            if (context.action.name == TagManager.PAUSE_ACTION) {
                player.SwitchState(player.PausedState);
            } else if (context.action.name == TagManager.INTERACT_ACTION) {
                player.SwitchState(player.InteractingState);
            }
        }
    }
}
