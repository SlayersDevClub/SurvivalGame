using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class IntGameObjectDictEventListener : MonoBehaviour {
    public IntGameObjectRuntimeDict dictVariable;
    public UnityEvent<int, GameObject> Response;

    private IntGameObjectDictChangedEvent Event;

    private void OnEnable() {
        Event = dictVariable.onValueChanged;
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(int key, GameObject value) { Response.Invoke(key, value); /* handle value as needed */ }
}
