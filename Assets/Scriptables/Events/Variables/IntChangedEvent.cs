using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/IntegerEvent")]
public class IntChangedEvent : ScriptableObject {
    private readonly List<IntEventListener> listeners = new List<IntEventListener>();

    public void Raise(int value) {
        for (int i = listeners.Count - 1; i >= 0; i--) {
            listeners[i].OnEventRaised(value);
        }
    }

    public void RegisterListener(IntEventListener listener) {
        if (!listeners.Contains(listener)) {
            listeners.Add(listener);
        }
    }

    public void UnregisterListener(IntEventListener listener) {
        listeners.Remove(listener);
    }
}