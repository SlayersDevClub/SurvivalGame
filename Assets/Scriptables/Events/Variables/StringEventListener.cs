using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class StringEventListener : MonoBehaviour, IEventListener {
    private StringChangedEvent Event;
    public UnityEvent<string> Response;
    public void Init() {
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(string value) { Response.Invoke(value); /* handle value as needed */ }
}
