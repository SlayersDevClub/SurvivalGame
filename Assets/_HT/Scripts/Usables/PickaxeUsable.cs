using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;

public class PickaxeUsable : MonoBehaviour, IUsable {
    private GameObject particlePrefab;

    bool isSwinging = false;
    float attackSpeed = 0.2f;
    Animator anim;
    ToolTemplate pick;
    LayerMask chopLayer;
    public void Setup() {
        particlePrefab = Resources.Load<GameObject>("Prefabs/VFX/" + "ToolHitFX-Stone-Prefab");
        anim = GetComponentInParent<Animator>();
        pick = GetComponent<ItemSetup>().GetBaseItemTemplate() as ToolTemplate;
        chopLayer = LayerMask.NameToLayer("Minable");
    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        if (context.action.name == TagManager.USE_ACTION) {
            if (!isSwinging) {
                isSwinging = true;
                InvokeRepeating("SwingTool", 0, attackSpeed * 3f);
            }
        } else if (context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("RIGHT CLICKING PICKAXE");
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) {
        if (context.action.name == TagManager.USE_ACTION) {
            isSwinging = false;
            CancelInvoke();
        }
    }

    private void SwingTool() {
            anim.SetTrigger("SwingPickaxe");       
    }


    public void TryToMine() {
        RaycastHit hit;
        if (Physics.Raycast(GameObject.Find("CameraControls").transform.position, 
            GameObject.Find("CameraControls").transform.forward, 
            out hit, 
            10f))

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
}
