using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;

public class PickaxeUsable : MonoBehaviour, IUsable
{
    bool isTimerFinished = true;
    float attackSpeed = 0.2f;
    Animator anim;
    ToolTemplate pick;

    public void Setup()
    {
        anim = GetComponentInParent<Animator>();
        pick = GetComponent<ItemSetup>().GetBaseItemTemplate() as ToolTemplate;
    }
    public void StartHandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION)
        {
            if (isTimerFinished) {
                InvokeRepeating("SwingTool", 0, attackSpeed);
            }
        }
        

        //RIGHT CLICK
        else if (context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("RIGHT CLICKING PICKAXE");
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) {
        if(context.action.name == TagManager.USE_ACTION) {
            CancelInvoke();
        }
    }

    private void SwingTool()
    {
        //DOTween.Restart("DoToolAction");
        //DOTween.PlayForward("DoToolAction");
        anim.SetTrigger("Swing");
        anim.SetFloat("X", Random.Range(-1f, 1f));
        anim.SetFloat("Y", Random.Range(0f, 1f));
    }

    public void TryToMine() {
        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f);
        GameObject obj;

        try {
            obj = hit.transform.gameObject;
            IMineable mineableObj = obj.GetComponent<IMineable>();
            mineableObj.TakeDamage(pick.damage, pick.pickaxeStrength, pick.axeStrength);
            Debug.Log("HITTING");
        } catch {

        }
        }

}
