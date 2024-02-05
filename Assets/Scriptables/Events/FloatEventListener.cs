using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class FloatEventListener : MonoBehaviour {
    public FloatVariable floatVariable;
    private FloatChangedEvent Event;
    public UnityEvent<float> Response;

    private void OnEnable() {
        Event = floatVariable.onValueChanged;
        Event.RegisterListener(this); }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(float value) { Response.Invoke(value); /* handle value as needed */ }
}
