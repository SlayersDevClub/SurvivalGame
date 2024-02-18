using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class GameObjectEventListener : MonoBehaviour, IEventListener {
    public void Init() {
        Event.RegisterListener(this);
    }

    public GameObjectChangedEvent Event;
    public UnityEvent<GameObject> Response;


    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(GameObject value) { Response.Invoke(value); /* handle value as needed */ }
}
