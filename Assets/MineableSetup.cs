using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MineableSetup : MonoBehaviour, IMineable
{
    public TileResourceTracker tileResourcePartOf;
    public MineableTemplate thisMineable;
    public int health;
    public int requiredPickaxeStrength;
    public int requiredAxeStrength;
    IWhenDestroy isDestroying;

    private void OnEnable()
    {
        tileResourcePartOf.resourcesOnTile.Add(gameObject);
        isDestroying = GetComponent<IWhenDestroy>();
    }

    private void OnDisable() {
        tileResourcePartOf.resourcesOnTile.Remove(gameObject);
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
