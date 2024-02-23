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
            if (objInteractedWith.GetComponent(typeof(IInteractable)) as IInteractable != null) {
                interactable = objInteractedWith.GetComponent(typeof(IInteractable)) as IInteractable;
            } else if (objInteractedWith.GetComponentInParent(typeof(IInteractable)) as IInteractable != null) {
                interactable = objInteractedWith.GetComponentInParent(typeof(IInteractable)) as IInteractable;
            // BROKEN
            //} else if (objInteractedWith.GetComponent<ItemSetup>() != null) {
                //Debug.Log("test1");
                //player.inventory.AddItem(objInteractedWith.GetComponent<ItemSetup>().GetItemID());
                //Debug.Log("test2");
                //GameObject.Destroy(objInteractedWith);
                //Debug.Log("test3");
                //player.isInteracting = true;
                //player.SwitchState(player.MovingState);
            } else {
                player.SwitchState(player.MovingState);
                return;
            }

            SwitchToUIActionMap(player);
            interactable.Activate(player);
        } catch {
            player.SwitchState(player.MovingState);
        }

        if (player.pir.playerInput.currentControlScheme == "Gamepad") {
            player.ui.ShowControllerCursor(true);
        }
    }

    public override void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context) {
        if (context.started && context.action.name == TagManager.INTERACT_ACTION) {
            interactable.Deactivate(player);
            player.SwitchState(player.MovingState);
        }
    }

    private void SwitchToUIActionMap(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
