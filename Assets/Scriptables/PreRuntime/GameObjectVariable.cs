using UnityEngine;

[CreateAssetMenu(menuName = "Variables/GameObject")]
public class GameObjectVariable : ScriptableObject
{
    public GameObjectChangedEvent onValueChanged;
    public GameObject Value;

    private void OnValidate() {
        onValueChanged.Raise(Value);
    }
}
