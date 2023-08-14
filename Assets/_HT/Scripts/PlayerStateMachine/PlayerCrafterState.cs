using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerCrafterState : PlayerBaseState
{
	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowGeneralCraftingPanel(true);
        player.ui.ShowPlayerInventory(true);
    }

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
			if (context.action.name == TagManager.INTERACT_ACTION) {
                player.ui.ShowGeneralCraftingPanel(false);
                player.ui.ShowPlayerInventory(false);
                player.SwitchState(player.MovingState);
			}
		}
	}
}
