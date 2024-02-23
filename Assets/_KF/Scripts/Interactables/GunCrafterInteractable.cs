using UnityEngine;

public class GunCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(PlayerStateMachine player) {
        player.ui.ShowGunCrafterPanel(true);
        player.ui.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftMetal();
    }

    public void Deactivate(PlayerStateMachine player) {
        player.ui.ShowGunCrafterPanel(false);
        player.ui.ShowPlayerInventory(false);
    }

}
