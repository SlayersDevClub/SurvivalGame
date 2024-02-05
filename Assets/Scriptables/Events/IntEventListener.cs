using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class IntEventListener : MonoBehaviour {
    public IntVariable intVariable;
    private IntChangedEvent Event;
    public UnityEvent<int> Response;

    private void OnEnable() {
        Event = intVariable.onValueChanged;
        Event.RegisterListener(this); }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(int value) { Response.Invoke(value); /* handle value as needed */ }
}
