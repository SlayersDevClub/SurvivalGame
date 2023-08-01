using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;

public class PlayerInputReader : CharacterInput
{
    public PlayerInput playerInput;
    private InputAction 
        move, 
        look, 
        jump, 
        sprint,
        pause;

    Interact interactor;
    bool jumping = false, sprinting = false, paused = false, interacting = false;

    void Start()
    {
        playerInput = GetComponent<PlayerInput>();
        move = playerInput.actions["Move"];
        look = playerInput.actions["Look"];
        jump = playerInput.actions["Jump"];
        sprint = playerInput.actions["Sprint"];
        pause = playerInput.actions["Pause"];

        interactor = transform.Find("Interactor").GetComponentInChildren<Interact>();
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

    public void Interact(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            if (!interacting) {
                interactor.InteractWith();
                interacting = true;
            } else {
                interactor.StopInteractWith();
                interacting = false;

                GetComponent<PlayerStateManager>().ChangePlayerState(PlayerControlState.Moving);
            }

        }   
    }
}
