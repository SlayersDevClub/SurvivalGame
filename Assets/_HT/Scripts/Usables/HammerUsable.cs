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
        if (transform.parent.GetComponent<HandRigConnector>())
        {
            transform.parent.GetComponent<HandRigConnector>().rightHandTarget = transform.GetChild(0).GetChild(0).Find("HandTarget");
            transform.parent.GetComponent<HandRigConnector>().SetIKHandPosition();
        }
        anim = GetComponentInParent<Animator>();
    }

    public void HandleInput(InputAction.CallbackContext context) {
        if (context.started) {
            if (context.action.name == TagManager.USE_ACTION) {
                anim.speed = attackSpeed * 3; //attack speed factor
                SwingTool();
            }

            //RIGHT CLICK
            if (context.action.name == TagManager.USE2_ACTION) {


            }
        }
        if (context.canceled) {
            anim.SetBool("IsSwinging", false);
        }
    }

    private void SwingTool()
    {
        anim.SetTrigger("SwingHammer");
        anim.SetBool("IsSwinging", true);
    }


}
