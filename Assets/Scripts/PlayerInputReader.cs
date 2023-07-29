using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;

public class PlayerInputReader : CharacterInput
{
    PlayerInput playerInput;
    InputAction move, look, jump;
    bool jumping = false;

    void Start()
    {
        playerInput = GetComponent<PlayerInput>();
        move = playerInput.actions["Move"];
        look = playerInput.actions["Look"];
        jump = playerInput.actions["Jump"];

    }

    public void Jumping(InputAction.CallbackContext context)
    {
        if (context.started) jumping = true;
        if (context.canceled) jumping = false;
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
}
