using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Sets/RuntimeDict")]

public abstract class RuntimeDict<TKey, TValue> : ScriptableObject {
    public GameObjectBoolDictChangedEvent onValueChanged;

    protected Dictionary<TKey, TValue> itemDictionary = new Dictionary<TKey, TValue>();

    public virtual void Add(TKey key, TValue value) {
        itemDictionary[key] = value;
    }

    public virtual bool Remove(TKey key) {
        if (itemDictionary.ContainsKey(key)) {
            itemDictionary.Remove(key);
            return true;
        }

        return false;
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

    public void Clear() {
        itemDictionary.Clear();
    }
}
