using UnityEngine;

public class GunCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(UIManager playerUIManager) {
        playerUIManager.ShowGunCrafterPanel(true);
        playerUIManager.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftMetal();
    }

    public void Deactivate(UIManager playerUIManager) {
        playerUIManager.ShowGunCrafterPanel(false);
        playerUIManager.ShowPlayerInventory(false);
    }

}
