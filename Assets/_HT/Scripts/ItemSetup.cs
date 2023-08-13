using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class ItemSetup : MonoBehaviour
{
    private int itemID;

    public BaseItemTemplate baseItemTemplate;
    private void Awake() {
        itemID = Int16.Parse(baseItemTemplate.Id);
    }

    public int GetItemID() {
        return itemID;
    }
}
