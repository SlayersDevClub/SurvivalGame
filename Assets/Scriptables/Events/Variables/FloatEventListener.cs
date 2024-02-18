using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class FloatEventListener : MonoBehaviour, IEventListener {
    public void Init() {
        Event.RegisterListener(this);
    }

    private FloatChangedEvent Event;
    public UnityEvent<float> Response;


    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(float value) { Response.Invoke(value); /* handle value as needed */ }
}
