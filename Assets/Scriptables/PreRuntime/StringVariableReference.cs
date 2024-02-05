using UnityEngine;

[System.Serializable]
public class StringVariableReference
{
    public bool UseConstant = true;
    public string ConstantValue;
    public StringVariable Variable;

    public string Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
    }
}
