using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MineableSetup : MonoBehaviour, IMineable
{
    public MineableTemplate thisMineable;
    public int health;
    public int requiredPickaxeStrength;
    public int requiredAxeStrength;
    IWhenDestroy isDestroying;

    private void Start()
    {
        isDestroying = GetComponent<IWhenDestroy>();
    }

    public void SetMineableTemplate(MineableTemplate mineable) {
        thisMineable = mineable;
        health = mineable.health;
        requiredPickaxeStrength = mineable.requiredPickaxeStrength;
        requiredAxeStrength = mineable.requiredAxeStrength;
    }

    public void TakeDamage(int damage, int pickaxeStrength, int axeStrength) {
        if(pickaxeStrength >= requiredPickaxeStrength || axeStrength >= requiredAxeStrength) {
            health -= damage;

            isDestroying.ShakeObject();

            if (health <= 0) {
                transform.GetComponent<IWhenDestroy>().Destroy(thisMineable.dropables);
                //OnDestroy();
            }
        }
    }
}
