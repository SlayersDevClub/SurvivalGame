using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SlotHotbarState : SlotBaseState {

    public override void EnterState(SlotStateMachine item) {
        Color32 normalSlotColor = new Color32(198, 198, 198, 240);
        if (item.transform.GetComponent<Image>().color != normalSlotColor) {
            item.transform.GetComponent<Image>().color = normalSlotColor;
        }
    }
    public override void StartHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }
    public override void EndHandleInput(SlotStateMachine item, InputAction.CallbackContext context) {
        throw new System.NotImplementedException();
    }

}
