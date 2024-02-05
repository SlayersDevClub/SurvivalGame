using UnityEngine;

[CreateAssetMenu(menuName = "Variables/String")]
public class StringVariable : ScriptableObject
{
    public StringChangedEvent onValueChanged;
    public string Value;
    private void OnValidate() {
        onValueChanged.Raise(Value);
    }
}
