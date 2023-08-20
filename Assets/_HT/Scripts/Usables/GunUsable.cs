using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class GunUsable : MonoBehaviour, IUsable
{
    //APPLY THIS SCRIPT TO GUN TO TEST AND SPAWN THAT GUN IN YOUR INVENTORY

    public void HandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK (FIRE)
        if(context.action.name == TagManager.USE_ACTION) {
            Debug.Log("SHOOTING");
        }
        //RIGHT CLICK (ADS)
        else if(context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("AIMING DOWN SIGHTS");
        }
        //R RELOAD
        else if(context.action.name == TagManager.RELOAD_ACTION) {
            Debug.Log("RELOADING");
        }

    }

}
