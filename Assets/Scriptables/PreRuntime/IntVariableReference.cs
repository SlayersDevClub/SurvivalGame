using UnityEngine;

[System.Serializable]
public class IntVariableReference
{
    public bool UseConstant = true;
    public int ConstantValue;
    public IntVariable Variable;

    public int Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
    }
}
