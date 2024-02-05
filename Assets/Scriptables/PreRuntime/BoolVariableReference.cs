using UnityEngine;

[System.Serializable]
public class BoolVariableReference
{
    public bool UseConstant = true;
    public bool ConstantValue;
    public BoolVariable Variable;

    public bool Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
    }
}
