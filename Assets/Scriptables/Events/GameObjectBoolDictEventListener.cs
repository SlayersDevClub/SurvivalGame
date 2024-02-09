using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class GameObjectBoolDictEventListener : MonoBehaviour {
    public GameObjectBoolRuntimeDict dictVariable;
    public UnityEvent<GameObject, bool> Response;

    private GameObjectBoolDictChangedEvent Event;

    private void OnEnable() {
        Event = dictVariable.onValueChanged;
        Event.RegisterListener(this);
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(GameObject key, bool value) { Response.Invoke(key, value); /* handle value as needed */ }
}
