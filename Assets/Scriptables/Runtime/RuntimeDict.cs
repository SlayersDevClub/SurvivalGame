using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Sets/RuntimeDict")]

public abstract class RuntimeDict<TKey, TValue> : ScriptableObject {
    private Dictionary<TKey, TValue> itemDictionary = new Dictionary<TKey, TValue>();

    public void Add(TKey key, TValue value) {
        if (!itemDictionary.ContainsKey(key)) {
            itemDictionary.Add(key, value);
        }
    }

    public void Remove(TKey key) {
        if (itemDictionary.ContainsKey(key)) {
            itemDictionary.Remove(key);
        }
    }

    public List<TKey> GetKeys() {
        return new List<TKey>(itemDictionary.Keys);
    }

    public List<TValue> GetValues() {
        return new List<TValue>(itemDictionary.Values);
    }

    public List<KeyValuePair<TKey, TValue>> GetItems() {
        return new List<KeyValuePair<TKey, TValue>>(itemDictionary);
    }
}
