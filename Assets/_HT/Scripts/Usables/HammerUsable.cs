using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class HammerUsable : MonoBehaviour, IUsable
{
    //APPLY THIS SCRIPT TO GUN TO TEST AND SPAWN THAT GUN IN YOUR INVENTORY

    public void HandleInput(InputAction.CallbackContext context) {

        Debug.Log(context.action.name);
        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION) {
            Debug.Log("LEFT CLICKING HAMMER");
        }
        
        //RIGHT CLICK
        else if (context.action.name == TagManager.USE2_ACTION) {

            Debug.Log("RIGHT CLICKING HAMMER");
        }

    }

}
