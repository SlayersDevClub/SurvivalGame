using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;

public class PlayerInputReader : CharacterInput
{
    PlayerInput playerInput;
    Interact playerInteractor;

    InputAction move, look, jump, sprint, interact;
    bool jumping = false, sprinting = false;

    void Start()
    {
        playerInput = GetComponent<PlayerInput>();
        playerInteractor = transform.GetChild(1).Find("CameraControls").GetComponent<Interact>();

        move = playerInput.actions["Move"];
        look = playerInput.actions["Look"];
        jump = playerInput.actions["Jump"];
        sprint = playerInput.actions["Sprint"];
        interact = playerInput.actions["Interact"];
    }

    public void CheckForControlChange(PlayerInput pi)
    {
        if(pi.currentControlScheme == "Gamepad")
        {
            GameObject.Find("CameraControls").GetComponent<CameraNewInput>().lookInputModifier = 0.01f;
        }

        if(pi.currentControlScheme == "MouseKeyboard")
        {
            GameObject.Find("CameraControls").GetComponent<CameraNewInput>().lookInputModifier = 0.001f;
        }
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
    public void Interacting(InputAction.CallbackContext context) {
        if (context.started) playerInteractor.InteractWith();
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

}
