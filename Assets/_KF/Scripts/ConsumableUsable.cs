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

    public void HandleInput(InputAction.CallbackContext context) {
        if (context.started) {
            if (context.action.name == TagManager.USE_ACTION) {
                Effectable effectable = transform.GetComponentInParent<Effectable>();
                bool effectApplied = effectable.ApplyEffect(consumable.effect);
                /*
                if (effectApplied)
                    Inventory.RemoveItem(transform.root.GetComponent<PlayerStateMachine>().equipItemSlot);*/
            }
        }

    }
}
