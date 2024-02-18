using UnityEngine;
using UnityEngine.Events;
public class GameEventListener : MonoBehaviour, IEventListener {
    public GameEvent Event;
    public UnityEvent Response;

    public void Init() {
        Event.RegisterListener(this);
    }
    private void OnEnable() { Event.RegisterListener(this); }

    private void OnDisable() { Event.UnregisterListener(this); }

    public void OnEventRaised() { Response.Invoke(); }
}