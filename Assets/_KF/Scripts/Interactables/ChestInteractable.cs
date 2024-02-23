using UnityEngine;

public class ChestInteractable : MonoBehaviour, IInteractable {

    public void Activate(PlayerStateMachine player) {
        player.ui.ShowChestPanel(true);
        player.ui.ShowPlayerInventory(true);

        SFXManager.instance.PlayOpenChest();
    }

    public void Deactivate(PlayerStateMachine player) {
        player.ui.ShowChestPanel(false);
        player.ui.ShowPlayerInventory(false);
    }

}
