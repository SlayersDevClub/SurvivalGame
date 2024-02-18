using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/RuntimeSetEvent")]

public class RuntimeSetEvent<T> : ScriptableObject {
    private List<RuntimeSetEventListener<T>> listeners = new List<RuntimeSetEventListener<T>>();

    public void Raise() {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised();
    }

    public void RegisterListener(RuntimeSetEventListener<T> listener) { listeners.Add(listener); }

    public void UnregisterListener(RuntimeSetEventListener<T> listener) { listeners.Remove(listener); }
}
