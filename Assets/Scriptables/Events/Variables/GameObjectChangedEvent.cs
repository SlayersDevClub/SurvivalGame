using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/GameObjectChange")]
public class GameObjectChangedEvent : ScriptableObject {
    private List<GameObjectEventListener> listeners = new List<GameObjectEventListener>();

    public void Raise(GameObject value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(value);
    }

    public void RegisterListener(GameObjectEventListener listener) {
        if (!listeners.Contains(listener))
            listeners.Add(listener);
    }

    public void UnregisterListener(GameObjectEventListener listener) {
        listeners.Remove(listener);
    }
}
