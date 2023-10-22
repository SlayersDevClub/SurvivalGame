using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;


public class PickaxeUsable : MonoBehaviour, IUsable {
    private GameObject particlePrefab;
    float attackSpeed = 0.2f;
    Animator anim;
    ToolTemplate pick;

    public void Setup() 
    {
        if (transform.parent.GetComponent<HandRigConnector>())
        {
            transform.parent.GetComponent<HandRigConnector>().handTarget = transform.GetChild(0).GetChild(0).Find("HandTarget");
            transform.parent.GetComponent<HandRigConnector>().SetIKHandPosition();
        }
        particlePrefab = Resources.Load<GameObject>("Prefabs/VFX/" + "ToolHitFX-Stone-Prefab");
        anim = GetComponentInParent<Animator>();
        pick = GetComponent<ItemSetup>().GetBaseItemTemplate() as ToolTemplate;

    }


    public void StartHandleInput(InputAction.CallbackContext context) 
    {
        if (context.action.name == TagManager.USE_ACTION) 
        {
            anim.speed = attackSpeed * 3; //attack speed factor
            SwingTool();
        } else if (context.action.name == TagManager.USE2_ACTION) 
        {
            Debug.Log("RIGHT CLICKING PICKAXE");
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) 
    {
        if (context.action.name == TagManager.USE_ACTION) 
        {
            anim.SetBool("IsSwinging", false);
        }
    }

    private void SwingTool() 
    {
        anim.SetTrigger("SwingPickaxe");
        anim.SetBool("IsSwinging", true);
    }

    public void TryToMine() 
    {
        RaycastHit hit;
        if (Physics.Raycast(GameObject.Find("CameraControls").transform.position,
            GameObject.Find("CameraControls").transform.forward,
            out hit,
            5f))
        {
            if (hit.transform.GetComponent<IMineable>() != null)
            {
                GameObject obj = hit.transform.gameObject;
                IMineable mineableObj = obj.GetComponent<IMineable>();
                MineableSetup thisSetup = mineableObj as MineableSetup;

                if (mineableObj != null)
                {
                    mineableObj.TakeDamage(pick.damage, pick.pickaxeStrength, pick.axeStrength);

                    var vfx = Instantiate(particlePrefab, hit.point, transform.root.rotation);
                    vfx.GetComponent<ParticleSystem>().startColor = thisSetup.thisMineable.hitColor;

                }

                SFXManager.instance.PlayStoneHit();
            }
            else 
            { 
                SFXManager.instance.PlaySwingTool(); 
            }
        } 
        else
        {
            SFXManager.instance.PlaySwingTool();
        }
    }
}
