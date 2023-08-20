using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;

public class PlayerInputReader : CharacterInput
{
    public PlayerInput playerInput;
    private InputAction move;

    Interact interactor;
    bool jumping = false, sprinting = false, paused = false;
    Inventory inventory;
    void Start()
    {
        inventory = GameObject.Find("Inventory").GetComponent<Inventory>();
        playerInput = GetComponent<PlayerInput>();
        move = playerInput.actions["Move"];
    }

    public void Jumping(InputAction.CallbackContext context)
    {
        if (context.started) jumping = true;
        if (context.canceled) jumping = false;
    }

    public void Sprinting(InputAction.CallbackContext context)
    {
        if (context.started) sprinting = true;
        if (context.canceled) sprinting = false;
    }
    public override float GetHorizontalMovementInput()
    {
        return move.ReadValue<Vector2>().x;
    }

    public override float GetVerticalMovementInput()
    {
        return move.ReadValue<Vector2>().y;
    }

    public override bool IsJumpKeyPressed()
    {
        return jumping;
    }

    public override bool IsSprintingPressed()
    {
        return sprinting;
    }

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

    public void UseEquipItem(InputAction.CallbackContext context) {
        if (context.started) {

            SlotStateMachine slotToUse = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();
            slotToUse.HandleInput(context);

        }
    }

    public void DropItem(InputAction.CallbackContext context) {
        if (context.started) {
            SlotStateMachine slotToUse = inventory.slots[transform.GetComponent<PlayerStateMachine>().equipItemSlot].GetComponent<SlotStateMachine>();
            slotToUse.HandleInput(context);
        }
    }

    public void GamePaused(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            if (!paused)
            {
                GetComponent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Paused);
                paused = true;
            }
            else
            {
                GetComponent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Moving);
                paused = false;
            }
        }
    }


}
