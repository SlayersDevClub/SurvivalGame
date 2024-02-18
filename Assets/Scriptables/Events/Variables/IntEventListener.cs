using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class IntEventListener : MonoBehaviour, IEventListener {
   
    public void Init() {
        Event.RegisterListener(this);
    }

    public IntChangedEvent Event;
    public UnityEvent<int> response;

    private void OnDisable() {
        Event.UnregisterListener(this);
    }

    public void OnEventRaised(int value) {
        response.Invoke(value);
        // handle value as needed
    }
}
