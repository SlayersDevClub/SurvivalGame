using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class AxeUsable : MonoBehaviour, IUsable
{
    //APPLY THIS SCRIPT TO TOOL TO TEST AND SPAWN THAT TOOL IN YOUR INVENTORY

    public void HandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION) {
            Debug.Log("LEFT CLICKING AXE");
        }
        //RIGHT CLICK
        else if (context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("RIGHT CLICKING AXE");
        }

    }

}
