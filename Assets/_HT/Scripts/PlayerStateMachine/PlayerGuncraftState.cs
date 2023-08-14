using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;

public class PlayerGunCraftState : PlayerBaseState {
	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowGunCrafterPanel(true);
        player.ui.ShowPlayerInventory(true);
	}

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
			if (context.action.name == TagManager.INTERACT_ACTION) {
                player.ui.ShowGunCrafterPanel(false);
                player.ui.ShowPlayerInventory(false);
                player.SwitchState(player.MovingState);
			}
		}
	}
}
