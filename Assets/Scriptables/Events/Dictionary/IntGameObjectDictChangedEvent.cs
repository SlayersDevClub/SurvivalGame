using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/IntGameObjectDictChangedEvent")]

public class IntGameObjectDictChangedEvent : ScriptableObject {
    private List<IntGameObjectDictEventListener> listeners = new List<IntGameObjectDictEventListener>();

    public void Raise(int key, GameObject value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(key, value);
    }
    public void RegisterListener(IntGameObjectDictEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(IntGameObjectDictEventListener listener) { listeners.Remove(listener); }
}
