using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerChestState : PlayerBaseState {
	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowChestPanel(true);
        player.ui.ShowPlayerInventory(true);
    }

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started)
        {
            player.ui.ShowChestPanel(false);
            player.ui.ShowPlayerInventory(false);
            player.SwitchState(player.MovingState);
		}
		
	}
}
