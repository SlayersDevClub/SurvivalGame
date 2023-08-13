using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;

public class PlayerPausedState : PlayerBaseState
{
    public override void EnterState(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        player.transform.Find("PlayerUI").GetComponent<UIManager>().ShowPauseMenu(true);
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.transform.Find("PlayerUI").GetComponent<UIManager>().ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if(context.action.name == TagManager.PAUSE_ACTION) {
            player.SwitchState(player.MovingState);
        }
    }
}
