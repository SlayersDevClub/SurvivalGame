using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerItemHolder : MonoBehaviour
{
    public GameObject structureHolder, gunHolder, resourceHolder, toolHolder, defaultHolder;

    public Inventory inventory;
    private void Start() {
        inventory.itemHolders[typeof(StructureTemplate)] = structureHolder;
        inventory.itemHolders[typeof(GunTemplate)] = gunHolder;
        inventory.itemHolders[typeof(ResourceTemplate)] = resourceHolder;
        inventory.itemHolders[typeof(ToolTemplate)] = toolHolder;

        inventory.structureHolder = structureHolder;
        inventory.gunHolder = gunHolder;
        inventory.resourceHolder = resourceHolder;
        inventory.toolHolder = toolHolder;
        inventory.defaultHolder = defaultHolder;
    }


}
