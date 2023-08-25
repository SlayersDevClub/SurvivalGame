using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class AxeUsable : MonoBehaviour, IUsable
{
    BaseItemTemplate thisItem;
    //APPLY THIS SCRIPT TO TOOL TO TEST AND SPAWN THAT TOOL IN YOUR INVENTORY
    private void Start() {
        thisItem = transform.GetComponent<ItemSetup>().GetBaseItemTemplate();
    }
    public void HandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION) {
            RaycastHit hit;

            Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f);

            if(hit.transform.gameObject.GetComponent<IMineable>() != null) {
                Debug.Log("MINING TREE");
            }
        }
        //RIGHT CLICK
        else if (context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("RIGHT CLICKING AXE");
        }

    }

}
