using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemHolder : MonoBehaviour
{
    public GameObject
        resourceSlot,
        gunSlot,
        toolSlot;

    public void EquipResourceSlot(ItemData item)
    {
        //instantiate the model here
        item.transform.parent = resourceSlot.transform;
    }

    public void EquipGunSlot(ItemData item)
    {
        //instantiate the model here
        item.transform.parent = gunSlot.transform;
    }

    public void EquipToolSlot(ItemData item)
    {
        //instantiate the model here
        item.transform.parent = toolSlot.transform;
    }

}
