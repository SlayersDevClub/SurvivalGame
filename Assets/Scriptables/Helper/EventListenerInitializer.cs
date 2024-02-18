using UnityEngine;

[CreateAssetMenu]
public class EventListenerInitializer : ScriptableObject {
    [RuntimeInitializeOnLoadMethod]
    static void Init() {
        MonoBehaviour[] objectsWithInterface = FindObjectsOfType<MonoBehaviour>(true);
        foreach (var obj in objectsWithInterface) {
            if (obj is IEventListener) {
                (obj as IEventListener).Init();
            }
        }
    }
}
