using UnityEngine;

[CreateAssetMenu(menuName = "Variables/Float")]
public class FloatVariable : ScriptableObject
{
    public FloatChangedEvent onValueChanged;
    public float Value;
    private void OnValidate() {
        onValueChanged.Raise(Value);
    }
}
