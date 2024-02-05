using UnityEngine;
using UnityEngine.InputSystem;
using CMF;
using Photon.Pun;

/*
 * Listener for player input events.
 */
public class PlayerInputReader : CharacterInput {
    public PlayerInput playerInput;
    public Inventory inventory;
    private InputAction move;
    bool jumping = false;
    public PhotonView view;
    public bool sprinting = false;

    void Awake() {
        move = playerInput.actions["Move"];
    }

    public void Jumping(InputAction.CallbackContext context) {
        if (context.started) jumping = true;
        if (context.canceled) jumping = false;
    }

    public void Sprinting(InputAction.CallbackContext context)
    {
        if (context.started) sprinting = true;
        if (context.canceled) sprinting = false;
    }

    /*
     * Called on event for hot bar navigation (i.e. pressing 1,2,3,...).
     * Swaps the currently equiped slot to the HotbarState and the newly equiped slot to the EquipState.
     */
    public void HotBarNav(InputAction.CallbackContext context) {
        if (context.started) {
            string slotName = context.action.name;

            if (!string.IsNullOrEmpty(slotName) && char.IsDigit(slotName[slotName.Length - 1])) {
                int slotNum = int.Parse(slotName[slotName.Length - 1].ToString());

                inventory.EquipSlot(slotNum - 1);
            }
        }
    }

    /*
     * Called on event for left click or right click.
     */

    
    public void UseEquipItem(InputAction.CallbackContext context) {
        if(inventory.currentHeldItem != null) {
            IUsable usableItem = inventory.currentHeldItem.GetComponent<IUsable>();

            if (usableItem != null) {
                usableItem.HandleInput(context);
            }
        }
    }

    public void DropItem(InputAction.CallbackContext context) {
        if (context.started) {
            //SlotStateMachine slotToUse = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();
            //slotToUse.StartHandleInput(context);
        }
    }

    public override float GetHorizontalMovementInput() {
        if (view.IsMine) {
            return move.ReadValue<Vector2>().x;
        }
        return 0;
    }

    public override float GetVerticalMovementInput() {
        if (view.IsMine) {
            return move.ReadValue<Vector2>().y;
        }
        return 0;
    }

    public override bool IsJumpKeyPressed() {
        return jumping;
    }

    public override bool IsSprintingPressed() {
        return sprinting;
    }
}
