using UnityEngine.InputSystem;
using UnityEngine;

/*
 * Player state when the player interacts with anything that opens a ui menu (crafters, chests, etc).
 * Delegates which state the player needs to be in based on what they interacted with.
 */
public class PlayerInteractingState : PlayerBaseState {

    public override void EnterState(PlayerStateMachine player) {
        float interactDistance = 5f;

        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, interactDistance);
        GameObject objInteractedWith;

        try {
            objInteractedWith = hit.transform.gameObject;

            // Perform interaction with 'objInteractedWith'
            if (objInteractedWith.name == "Chest") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.ChestState);
            } else if (objInteractedWith.name == "GunCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.GunCraftState);
            } else if (objInteractedWith.name == "GeneralCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.CrafterState);
            } else if (objInteractedWith.name == "ToolCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.ToolCraftState);
            } else if (objInteractedWith.GetComponent<ItemSetup>() != null) {
                //GameObject.Find("Inventory").GetComponent<Inventory>().AddItem(objInteractedWith.GetComponent<ItemSetup>().GetItemID());
                GameObject.Destroy(objInteractedWith);
                player.isInteracting = true;
                player.SwitchState(player.MovingState);
            } else {
                player.SwitchState(player.MovingState);
            }
        } catch {
            player.SwitchState(player.MovingState);
            //player.SwitchState(player.InventoryState);
        }

        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.ui.ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        // Not needed for this state.
    }

    private void SwitchToUIActionMap(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
