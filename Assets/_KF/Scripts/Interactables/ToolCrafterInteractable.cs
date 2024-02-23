using UnityEngine;

public class ToolCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(PlayerStateMachine player) {
        player.ui.ShowToolCraftingPanel(true);
        player.ui.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftWood();
    }

    public void Deactivate(PlayerStateMachine player) {
        player.ui.ShowToolCraftingPanel(false);
        player.ui.ShowPlayerInventory(false);
    }

}
