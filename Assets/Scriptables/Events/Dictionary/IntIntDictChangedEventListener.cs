using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class IntIntDictChangedEventListener : MonoBehaviour {
    public IntIntRuntimeDict dictVariable;
    public UnityEvent<int, int> Response;

    private IntIntDictChangedEvent Event;

    private void OnEnable() {
        Event = dictVariable.onValueChanged;
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(int key, int value) { Response.Invoke(key, value); /* handle value as needed */ }
}
