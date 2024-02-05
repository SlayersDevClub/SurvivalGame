using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/BooleanChange")]
public class BoolChangedEvent : ScriptableObject {
    private List<BoolEventListener> listeners = new List<BoolEventListener>();

    public void Raise(bool value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(value);
    }

    public void RegisterListener(BoolEventListener listener) {
        if (!listeners.Contains(listener))
            listeners.Add(listener);
    }

    public void UnregisterListener(BoolEventListener listener) {
        listeners.Remove(listener);
    }
}
