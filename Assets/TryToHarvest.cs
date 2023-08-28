using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TryToHarvest : MonoBehaviour
{
    public void TryToolHarvest() {
        PickaxeUsable pickUse = transform.GetComponentInChildren<PickaxeUsable>();
        AxeUsable axeUse = transform.GetComponentInChildren<AxeUsable>();

        if(pickUse != null) {
            pickUse.TryToMine();
        }
        else if(axeUse != null) {
            //axeUse.TryToMine();
        }

    }
        
    

}
