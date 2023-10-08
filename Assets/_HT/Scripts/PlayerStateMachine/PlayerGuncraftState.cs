using UnityEngine.InputSystem;

/*
 * Player state when they open a gun crafter.
 */
public class PlayerGunCraftState : PlayerBaseState {

	public override void EnterState(PlayerStateMachine player) {
        player.ui.ShowGunCrafterPanel(true);
        player.ui.ShowPlayerInventory(true);
        SFXManager.instance.PlayCraftMetal();
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
