using UnityEngine;

/*
 * Used to set item models as children of the player so they can be visually displayed in their hand.
 */
public class ItemHolder : MonoBehaviour {
    public GameObject
        resourceSlot,
        gunSlot,
        toolSlot;

    public void EquipResourceSlot(ItemData item) {
        //instantiate the model here
        item.transform.parent = resourceSlot.transform;
    }

    public void EquipGunSlot(ItemData item) {
        //instantiate the model here
        item.transform.parent = gunSlot.transform;
    }

    public void EquipToolSlot(ItemData item) {
        //instantiate the model here
        item.transform.parent = toolSlot.transform;
    }

}
