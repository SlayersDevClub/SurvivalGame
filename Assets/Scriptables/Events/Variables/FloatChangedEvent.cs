using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/FloatChange")]

public class FloatChangedEvent : ScriptableObject {
    private List<FloatEventListener> listeners = new List<FloatEventListener>();

    public void Raise(float value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(value);
    }
    public void RegisterListener(FloatEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(FloatEventListener listener) { listeners.Remove(listener); }
}
