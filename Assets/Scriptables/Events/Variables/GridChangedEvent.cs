using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(menuName = "Events/GridChange")]

public class GridChangedEvent : ScriptableObject {
    private List<GridEventListener> listeners = new List<GridEventListener>();

    public void Raise(Grid value) {
        for (int i = listeners.Count - 1; i >= 0; i--)
            listeners[i].OnEventRaised(value);
    }
    public void RegisterListener(GridEventListener listener) { listeners.Add(listener); }

    public void UnregisterListener(GridEventListener listener) { listeners.Remove(listener); }
}
