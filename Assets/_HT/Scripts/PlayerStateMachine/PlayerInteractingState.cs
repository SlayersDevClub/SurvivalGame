using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;
public class PlayerInteractingState : PlayerBaseState
{
    public override void EnterState(PlayerStateMachine player) {

            float interactDistance = 5f;

            RaycastHit hit;
            Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, interactDistance);
            GameObject obj;

            try {
                obj = hit.transform.gameObject;

            // Perform interaction with 'obj'
            if (obj.name == "Chest") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.ChestState);
            } else if (obj.name == "WeaponCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.GunCraftState);
            } else if (obj.name == "GeneralCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.CrafterState);
            } else if (obj.name == "ToolCrafter") {
                SwitchToUIActionMap(player);
                player.SwitchState(player.ToolCraftState);
            } else if (obj.GetComponent<ItemSetup>() != null) {
                GameObject.Find("Inventory").GetComponent<Inventory>().AddItem(obj.GetComponent<ItemSetup>().GetItemID());
                GameObject.Destroy(obj);
                player.pickedUp = true;
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
    }

    private void SwitchToUIActionMap(PlayerStateMachine player) {
        player.pir.playerInput.SwitchCurrentActionMap("UI");
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
