using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class ItemSetup : MonoBehaviour
{
    [SerializeField] private int itemID;
    [SerializeField] private BaseItemTemplate item;
    //private void Awake() {
      //  itemID = Int16.Parse(baseItemTemplate.Id);
    //}

    public int GetItemID() {
        return itemID;
    }
    public void SetItemID(int givenID) {
        itemID = givenID;
    }

    public BaseItemTemplate GetBaseItemTemplate() {
        return item;
    }
    public void SetBaseItemTemplate(BaseItemTemplate itemToAssign) {
        item = itemToAssign;
    }
}
