using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Sets/IntGameObjectRuntimeDict")]

public class IntGameObjectRuntimeDict : RuntimeDict<int, GameObject> {
    public IntGameObjectDictChangedEvent onValueChanged;

    public override void Add(int key, GameObject value) {
        base.Add(key, value);
        onValueChanged.Raise(key, value);
    }

    public override bool Remove(int key) {
        GameObject value = itemDictionary[key];

        if (base.Remove(key)) {
            onValueChanged.Raise(key, value);
            return true;
        }

        return false;
    }
}
