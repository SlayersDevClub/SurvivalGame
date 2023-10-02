using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;
using Photon.Pun;

/*
 * Listener for player input events.
 */
public class PlayerInputReader : CharacterInput {
    public PlayerInput playerInput;
    private InputAction move;

    bool jumping = false, sprinting = false, paused = false;
    Inventory inventory;
    public PhotonView view;

    void Awake() {
        inventory = transform.Find("PlayerUI/Inventory").GetComponent<Inventory>();
        move = playerInput.actions["Move"];
    }

    public void Jumping(InputAction.CallbackContext context) {
        if (context.started) jumping = true;
        if (context.canceled) jumping = false;
    }

    public void Sprinting(InputAction.CallbackContext context) {
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

                SlotStateMachine slotToEquip = inventory.slots[slotNum - 1].GetComponent<SlotStateMachine>();
                SlotStateMachine slotToUnequip = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();
                slotToUnequip.SwitchState(slotToUnequip.HotbarState);
                slotToEquip.SwitchState(slotToEquip.EquipState);
            }
        }
    }

    /*
     * Called on event for left click or right click.
     */
    public void UseEquipItem(InputAction.CallbackContext context) {
        SlotStateMachine slotToUse = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();

        if (context.started) {
            slotToUse.StartHandleInput(context);

        }

        if (context.canceled) {
            slotToUse.EndHandleInput(context);
        }
    }

    public void DropItem(InputAction.CallbackContext context) {
        if (context.started) {
            SlotStateMachine slotToUse = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();
            slotToUse.StartHandleInput(context);
        }
    }

    public void GamePaused(InputAction.CallbackContext context) {
        if (context.started) {
            if (!paused) {
                GetComponent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Paused);
                paused = true;
            } else {
                GetComponent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Moving);
                paused = false;
            }
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
