using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/GameObjectBoolDictChangedEvent")]

public class GameObjectBoolDictChangedEvent : ScriptableObject {
    private List<GameObjectBoolDictEventListener> listeners = new List<GameObjectBoolDictEventListener>();

    public void Raise(GameObject key, bool value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(key, value);
    }
    public void RegisterListener(GameObjectBoolDictEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(GameObjectBoolDictEventListener listener) { listeners.Remove(listener); }
}
