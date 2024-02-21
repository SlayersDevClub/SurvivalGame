using UnityEngine.InputSystem;
using UnityEngine;

/*
 * Player state when the player interacts with anything that opens a ui menu (crafters, chests, etc).
 */
public class PlayerInteractingState : PlayerBaseState {

    private GameObject objInteractedWith;
    IInteractable interactable;

    public override void EnterState(PlayerStateMachine player) {
        float interactDistance = 5f;

        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, interactDistance);

        try {
            objInteractedWith = hit.transform.gameObject;

            // Perform interaction with 'objInteractedWith'
            if (objInteractedWith.GetComponent<ChestInteractable>() != null) {
                interactable = objInteractedWith.GetComponent<ChestInteractable>();
            } else if (objInteractedWith.GetComponent<GeneralCrafterInteractable>() != null) {
                interactable = objInteractedWith.GetComponent<GeneralCrafterInteractable>();
            } else {
                player.SwitchState(player.MovingState);
                return;
            }

            SwitchToUIActionMap(player);
            interactable.Activate(player.ui);

            /*if (objInteractedWith.name == "Chest") {
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
            } else if (objInteractedWith.GetComponentInParent(typeof(IInteractable)) as IInteractable != null) {
                SwitchToUIActionMap(player);
                (objInteractedWith.GetComponentInParent(typeof(IInteractable)) as IInteractable).Activate();
            } else {
                player.SwitchState(player.MovingState);
            }*/
        } catch {
            player.SwitchState(player.MovingState);
        }

        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.ui.ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        interactable.Deactivate(player.ui);

        if (context.started && context.action.name == TagManager.INTERACT_ACTION)
            player.SwitchState(player.MovingState);
    }

    private void SwitchToUIActionMap(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
