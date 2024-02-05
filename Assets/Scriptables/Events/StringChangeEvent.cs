using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/StringChange")]

public class StringChangedEvent : ScriptableObject {
    private List<StringEventListener> listeners = new List<StringEventListener>();

    public void Raise(string value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(value);
    }
    public void RegisterListener(StringEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(StringEventListener listener) { listeners.Remove(listener); }
}
