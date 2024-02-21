using UnityEngine;

public class GeneralCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(UIManager playerUIManager) {
        playerUIManager.ShowGeneralCraftingPanel(true);
        playerUIManager.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftElectronic();
    }

    public void Deactivate(UIManager playerUIManager) {
        playerUIManager.ShowGeneralCraftingPanel(false);
        playerUIManager.ShowPlayerInventory(false);
    }

}
