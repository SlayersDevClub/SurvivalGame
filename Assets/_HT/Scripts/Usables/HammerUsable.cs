using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class HammerUsable : MonoBehaviour, IUsable
{
    //APPLY THIS SCRIPT TO GUN TO TEST AND SPAWN THAT GUN IN YOUR INVENTORY
    Animator anim;
    public float attackSpeed = 0.2f;
    private void Start()
    {
        transform.parent.GetComponent<HandRigConnector>().handTarget = transform.GetChild(0).GetChild(0).Find("HandTarget");
        transform.parent.GetComponent<HandRigConnector>().SetIKHandPosition();
        anim = GetComponentInParent<Animator>();
    }
    public void StartHandleInput(InputAction.CallbackContext context) {
        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION) {
            anim.speed = attackSpeed * 3; //attack speed factor
            SwingTool();
        }
        
        //RIGHT CLICK
        if (context.action.name == TagManager.USE2_ACTION) {


        }

    }
    public void EndHandleInput(InputAction.CallbackContext context) {
        anim.SetBool("IsSwinging", false);
    }

    private void SwingTool()
    {
        anim.SetTrigger("SwingHammer");
        anim.SetBool("IsSwinging", true);
    }


}
