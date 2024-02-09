using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class StringEventListener : MonoBehaviour {
    public StringVariable stringVariable;
    private StringChangedEvent Event;
    public UnityEvent<string> Response;

    private void OnEnable() {
        Event = stringVariable.onValueChanged;
        Event.RegisterListener(this);
        Event.Raise(stringVariable.Value);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(string value) { Response.Invoke(value); /* handle value as needed */ }
}
