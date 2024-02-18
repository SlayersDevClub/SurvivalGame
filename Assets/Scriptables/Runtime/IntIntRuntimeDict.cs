using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[CreateAssetMenu(menuName = "Sets/Int Int Dict")]

public class IntIntRuntimeDict : RuntimeDict<int,int>
{
    public IntIntDictChangedEvent onValueChanged;

    public override void Add(int key, int value) {
        base.Add(key, value);
        onValueChanged.Raise(key, value);
    }

    public override bool Remove(int key) {
        int value = itemDictionary[key];

        if (base.Remove(key)) {
            onValueChanged.Raise(key, value);
            return true;
        }

        return false;
    }
}
