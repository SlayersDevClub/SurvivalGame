using UnityEngine.InputSystem;

/*
 * Player state when they open a chest.
 */
public class PlayerChestState : PlayerBaseState {

	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowChestPanel(true);
        player.ui.ShowPlayerInventory(true);
        SFXManager.instance.PlayOpenChest();
    }

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
            player.ui.ShowChestPanel(false);
            player.ui.ShowPlayerInventory(false);
            player.SwitchState(player.MovingState);
		}
	}
}
