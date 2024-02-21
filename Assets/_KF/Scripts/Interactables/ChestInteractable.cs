using UnityEngine;

public class ChestInteractable : MonoBehaviour, IInteractable {

    public void Activate(UIManager playerUIManager) {
        playerUIManager.ShowChestPanel(true);
        playerUIManager.ShowPlayerInventory(true);

        //SFXManager.instance.PlayOpenChest();
    }

    public void Deactivate(UIManager playerUIManager) {
        playerUIManager.ShowChestPanel(false);
        playerUIManager.ShowPlayerInventory(false);
    }

}
