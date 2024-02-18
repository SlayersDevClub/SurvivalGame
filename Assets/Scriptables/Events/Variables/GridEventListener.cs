using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class GridEventListener : MonoBehaviour, IEventListener {
    private GridChangedEvent Event;
    public UnityEvent<Grid> Response;

    public void Init() {
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(Grid value) { Response.Invoke(value); /* handle value as needed */ }
}
