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
    public void Setup() {
        particlePrefab = Resources.Load<GameObject>("Prefabs/VFX/" + "ToolHitFX-Prefab");
        anim = GetComponentInParent<Animator>();
        pick = GetComponent<ItemSetup>().GetBaseItemTemplate() as ToolTemplate;
    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        if (context.action.name == TagManager.USE_ACTION) {
            if (!isSwinging) {
                isSwinging = true;
                InvokeRepeating("SwingTool", 0, attackSpeed);
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
            anim.SetTrigger("Swing");
            anim.SetFloat("X", Random.Range(-1f, 1f));
            anim.SetFloat("Y", Random.Range(0f, 1f));
        
    }


    public void TryToMine() {
        RaycastHit hit;
        if (Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f)) {
            GameObject obj = hit.transform.gameObject;
            IMineable mineableObj = obj.GetComponent<IMineable>();

            if (mineableObj != null) {
                Debug.Log("STRIKMING");
                mineableObj.TakeDamage(pick.damage, pick.pickaxeStrength, pick.axeStrength);
                Instantiate(particlePrefab, hit.point, transform.root.rotation);
                Debug.Log("HITTING");
            }
        }
    }
}
