using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public interface IUsable
{
    public void StartHandleInput(InputAction.CallbackContext context);
    public void EndHandleInput(InputAction.CallbackContext context);
}
