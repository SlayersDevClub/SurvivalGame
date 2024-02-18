using UnityEngine;
using UnityEngine.Events;
public class RuntimeSetEventListener<T> : MonoBehaviour {
    public RuntimeSet<T> setVariable;
    private RuntimeSetEvent<T> Event;
    public UnityEvent<T> Response;


    private void OnEnable() {
        Event = setVariable.runtimeSetEvent;
        Event.RegisterListener(this);
    
    }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised() { Response.Invoke(setVariable.mostRecentlyAddedOrRemoved); }
}