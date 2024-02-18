using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GuideUpdater : MonoBehaviour
{
    public GameObject activeTipHolder;
    private GameObject activeTipShown;
    public void ChangeTipToActiveTip(GameObject activeTip) {
        if(activeTipHolder.transform.childCount > 0) {
            for (int i = activeTipHolder.transform.childCount - 1; i >= 0; i--) {
                GameObject child = activeTipHolder.transform.GetChild(i).gameObject;
                Destroy(child);
            }
        }

        if (activeTip == null) {
            return;
        } else {
            activeTipShown = activeTip;
            Instantiate(activeTipShown, activeTipHolder.transform);
        }
    }
}
