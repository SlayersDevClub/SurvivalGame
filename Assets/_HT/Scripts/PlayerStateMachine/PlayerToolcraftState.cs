using UnityEngine.InputSystem;

/*
 * Player state when they open a tool crafter.
 */
public class PlayerToolcraftState : PlayerBaseState {

	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowToolCraftingPanel(true);
        player.ui.ShowPlayerInventory(true);
        SFXManager.instance.PlayCraftWood();
    }

	public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
		if (context.started) {
			if (context.action.name == TagManager.INTERACT_ACTION) {
                player.ui.ShowToolCraftingPanel(false);
                player.ui.ShowPlayerInventory(false);
                player.SwitchState(player.MovingState);
            }
		}
	}
}