using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public interface IUsable
{
    public void HandleInput(InputAction.CallbackContext context);
}
