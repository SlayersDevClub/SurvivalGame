using UnityEngine.InputSystem;

/*
 * Player state when they open a general crafter.
 */
public class PlayerCrafterState : PlayerBaseState {

	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowGeneralCraftingPanel(true);
        player.ui.ShowPlayerInventory(true);
        SFXManager.instance.PlayCraftElectronic();
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
