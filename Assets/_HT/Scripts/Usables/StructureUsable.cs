using UnityEngine;
using UnityEngine.InputSystem;

public class StructureUsable : MonoBehaviour, IUsable {
    private bool allowMovement = true; // Flag to control movement
    bool validSpot = false;

    public void HandleInput(InputAction.CallbackContext context) {
        // LEFT CLICK
        if (context.started) {
            if (context.action.name == TagManager.USE_ACTION) {
                allowMovement = !allowMovement; // Toggle the movement flag
            }
        }

    }


    private void Update() {
        if (allowMovement) {
            validSpot = SnapGridCenter.instance.Mover(gameObject);
        } else {
            if (validSpot) {
                PlayerStateMachine player = GameObject.Find("Player_1").GetComponent<PlayerStateMachine>();
                gameObject.transform.parent = null;
                player.inv.RemoveItem(player.equipItemSlot);

                validSpot = false;
            }
            
        }
    }
}
