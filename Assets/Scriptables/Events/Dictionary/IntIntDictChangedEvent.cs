using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/IntIntDictChangedEvent")]

public class IntIntDictChangedEvent : ScriptableObject {
    private List<IntIntDictChangedEventListener> listeners = new List<IntIntDictChangedEventListener>();

    public void Raise(int key, int value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(key, value);
    }
    public void RegisterListener(IntIntDictChangedEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(IntIntDictChangedEventListener listener) { listeners.Remove(listener); }
}
