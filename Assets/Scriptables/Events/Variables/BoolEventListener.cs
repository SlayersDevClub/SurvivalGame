using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class BoolEventListener : MonoBehaviour, IEventListener {
    private BoolChangedEvent Event;
    public UnityEvent<bool> Response;

    public void Init() {
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(bool value) { Response.Invoke(value); /* handle value as needed */ }
}
