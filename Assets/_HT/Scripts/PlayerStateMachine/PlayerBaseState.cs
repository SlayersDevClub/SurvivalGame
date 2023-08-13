using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public abstract class PlayerBaseState
{
    public abstract void EnterState(PlayerStateMachine player);

    public abstract void HandleInput(PlayerStateMachine player, InputAction.CallbackContext context);
}
