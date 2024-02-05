using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Sets/GameObjectBoolRuntimeDict")]

public class GameObjectBoolRuntimeDict : RuntimeDict<GameObject, bool> {
    public override void Add(GameObject key, bool value) {
        base.Add(key, value);
        onValueChanged.Raise(key, value);

    }

    public override bool Remove(GameObject key) {
        bool value = itemDictionary[key];

        if (base.Remove(key)) {
            onValueChanged.Raise(key, value);
            return true;
        }

        return false;
    }
}
