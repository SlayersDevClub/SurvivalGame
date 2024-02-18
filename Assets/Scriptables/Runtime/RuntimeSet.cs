using System.Collections.Generic;
using UnityEngine;

public abstract class RuntimeSet<T> : ScriptableObject {
    public List<T> Items = new List<T>();
    public T mostRecentlyAddedOrRemoved;
    public RuntimeSetEvent<T> runtimeSetEvent;

    public void Add(T thing) {
        if (!Items.Contains(thing)) {
            Items.Add(thing);
            mostRecentlyAddedOrRemoved = thing;
            runtimeSetEvent.Raise();
        }
    }

    public void Remove(T thing) {
        if (Items.Contains(thing)) {
            Items.Remove(thing);
            mostRecentlyAddedOrRemoved = thing;
            runtimeSetEvent.Raise();
        }
            
    }

    public bool Contains(T thing) {
        return Items.Contains(thing);
    }
}