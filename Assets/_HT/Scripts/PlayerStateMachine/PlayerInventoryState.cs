using UnityEngine.InputSystem;

/*
 * Player state when the inventory is opened??
 * TODO: Appears to never be used and does the same thing as the pause state. Keep so this can be used when pause state is for a pause menu??
 */
public class PlayerInventoryState : PlayerBaseState {
	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowPlayerInventory(true);
	}

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
			if (context.action.name == TagManager.INTERACT_ACTION) {
                player.ui.ShowPlayerInventory(false);
                player.SwitchState(player.MovingState);
			}
		}
	}
}
