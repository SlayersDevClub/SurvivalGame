using System.Linq;
using UnityEngine;

public class ToolCrafterInteractable : MonoBehaviour, IInteractable {

    public Inventory inventory;

    private CanvasGroup canvasGroup;

    private void Awake() {
        canvasGroup = GetComponentInChildren<CanvasGroup>();
        canvasGroup.gameObject.SetActive(false);

        inventory = ScriptableObject.CreateInstance<Inventory>();
        inventory.itemSlots = GetComponentsInChildren<ItemSlot>(true).ToList();
        inventory.outputSlot = GetComponentInChildren<OutputSlot>(true);
        
        foreach (ItemSlot slot in inventory.itemSlots) {
            slot.inventory = inventory;
        }
    }

    public void Activate(PlayerStateMachine player) {
        player.ui.ActivateCanvasGroup(canvasGroup);
        player.ui.ShowPlayerInventory(true);

        SFXManager.instance.PlayCraftWood();
    }

    public void Deactivate(PlayerStateMachine player) {
        player.ui.DeactivateCanvasGroup(canvasGroup);
        player.ui.ShowPlayerInventory(false);
    }

}
