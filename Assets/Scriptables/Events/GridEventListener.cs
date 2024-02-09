using UnityEngine;
using UnityEngine.Events;
using System.Collections.Generic;
using System;

public class GridEventListener : MonoBehaviour {
    public GridVariable gridVariable;
    private GridChangedEvent Event;
    public UnityEvent<Grid> Response;

    private void OnEnable() {
        Event = gridVariable.onValueChanged;
        Event.RegisterListener(this); }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised(Grid value) { Response.Invoke(value); /* handle value as needed */ }
}
