using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerChestState : PlayerBaseState {
	public override void EnterState(PlayerStateMachine player) {
		foreach (Transform slotTransform in player.slotPanel.transform.Find("ChestSlots")) {
			GameObject slot = slotTransform.gameObject;
			slot.SetActive(true);
		}
	}

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
			if (context.action.name == TagManager.INTERACT_ACTION) {
				foreach (Transform slotTransform in player.slotPanel.transform.Find("ChestSlots")) {
					GameObject slot = slotTransform.gameObject;
					slot.SetActive(false);
				}
				player.SwitchState(player.MovingState);
			}
		}
	}
}
