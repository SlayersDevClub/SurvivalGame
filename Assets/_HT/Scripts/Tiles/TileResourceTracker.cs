using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TileResourceTracker : MonoBehaviour
{
    public GameObjectRuntimeSet resourcesOnTile;

    public void TreeAdded(GameObject tree) {
        Debug.Log(tree.name);
    }
}
