using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TryToHarvest : MonoBehaviour
{
    Animator anim;
    private void Start()
    {
        anim = GetComponent<Animator>();
    }
    public void RandomizeSwingDirection()
    {
        anim.SetFloat("X", Random.Range(-1f, 1f));
        anim.SetFloat("Y", Random.Range(0.01f, 1f));
    }

    public void TryToolHarvest() {

        PickaxeUsable pickUse = transform.GetComponentInChildren<PickaxeUsable>();
        AxeUsable axeUse = transform.GetComponentInChildren<AxeUsable>();

            if (pickUse != null)
            {
                pickUse.TryToMine();
            }
            else if (axeUse != null)
            {
                axeUse.TryToMine();
            }
    }
        
    

}
