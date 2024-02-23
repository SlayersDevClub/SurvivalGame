using UnityEngine;

public class GeneralCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(PlayerStateMachine player) {
        player.ui.ShowGeneralCraftingPanel(true);
        player.ui.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftElectronic();
    }

    public void Deactivate(PlayerStateMachine player) {
        player.ui.ShowGeneralCraftingPanel(false);
        player.ui.ShowPlayerInventory(false);
    }

}
