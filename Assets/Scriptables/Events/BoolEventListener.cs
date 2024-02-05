using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class BoolEventListener : MonoBehaviour {
    public BoolVariable boolVariable;
    private BoolChangedEvent Event;
    public UnityEvent<bool> Response;

    private void OnEnable() {
        Event = boolVariable.onValueChanged;
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(bool value) { Response.Invoke(value); /* handle value as needed */ }
}
