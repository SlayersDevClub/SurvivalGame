using UnityEngine;

public class ToolCrafterInteractable : MonoBehaviour, IInteractable {

    public void Activate(UIManager playerUIManager) {
        playerUIManager.ShowToolCraftingPanel(true);
        playerUIManager.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftWood();
    }

    public void Deactivate(UIManager playerUIManager) {
        playerUIManager.ShowToolCraftingPanel(false);
        playerUIManager.ShowPlayerInventory(false);
    }

}
