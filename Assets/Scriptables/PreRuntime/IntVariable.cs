using UnityEngine;

[CreateAssetMenu(menuName = "Variables/Integer")]
public class IntVariable : ScriptableObject
{
    public IntChangedEvent onValueChanged;
    public int Value;
    private void OnValidate() {
        onValueChanged.Raise(Value);
    }
}
