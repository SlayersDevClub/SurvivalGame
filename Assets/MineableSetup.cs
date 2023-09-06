using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MineableSetup : MonoBehaviour, IMineable
{
    [SerializeField] private MineableTemplate thisMineable;
    public int health;
    public int requiredPickaxeStrength;
    public int requiredAxeStrength;
    // Start is called before the first frame update

    public void SetMineableTemplate(MineableTemplate mineable) {
        thisMineable = mineable;
        health = mineable.health;
        requiredPickaxeStrength = mineable.requiredPickaxeStrength;
        requiredAxeStrength = mineable.requiredAxeStrength;
    }

    public void TakeDamage(int damage, int pickaxeStrength, int axeStrength) {
        if(pickaxeStrength > requiredPickaxeStrength || axeStrength > requiredAxeStrength) {
            health -= damage;

            if (health <= 0) {
                Debug.Log("DEALINGDMG");
                transform.GetComponent<IWhenDestroy>().Destroy(thisMineable.dropables);
                //OnDestroy();
            }
        }
    }

}
