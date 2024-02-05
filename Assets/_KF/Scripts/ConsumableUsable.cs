using UnityEngine;
using UnityEngine.InputSystem;
using Gamekit3D;

public class ConsumableUsable : MonoBehaviour, IUsable {

    ConsumableTemplate consumable;
    HandRigConnector handRig;

    public void Setup() {
        consumable = GetComponent<ItemSetup>().GetBaseItemTemplate() as ConsumableTemplate;
        handRig = GetComponentInParent<HandRigConnector>() ?? null;

        //Hands poser setup
        if (handRig) {
            foreach (Transform child in GetComponentsInChildren<Transform>()) {
                if (child.CompareTag("LeftHandTarget")) {
                    handRig.leftHandTarget = child.GetChild(0);
                }

                if (child.CompareTag("RightHandTarget")) {
                    handRig.rightHandTarget = child.GetChild(0);
                }
            }

            handRig.SetIKHandPosition();
        }

        enabled = true;
    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        if (context.action.name == TagManager.USE_ACTION) {
            Effectable effectable = transform.GetComponentInParent<Effectable>();
            bool effectApplied = effectable.ApplyEffect(consumable.effect);

            if (effectApplied)
                transform.root.GetComponent<PlayerStateMachine>().inv.RemoveItem(transform.root.GetComponent<PlayerStateMachine>().equipItemSlot);
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) {
        if (context.action.name == TagManager.USE_ACTION) {
            // add 
        }
    }
}
