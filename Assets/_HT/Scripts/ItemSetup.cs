using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class ItemSetup : MonoBehaviour
{
    [SerializeField] private int itemID;
    //private void Awake() {
      //  itemID = Int16.Parse(baseItemTemplate.Id);
    //}

    public int GetItemID() {
        return itemID;
    }
    public void SetItemID(int givenID) {
        itemID = givenID;
    }
}
