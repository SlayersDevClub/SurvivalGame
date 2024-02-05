using UnityEngine;

[System.Serializable]
public class FloatVariableReference
{
    public bool UseConstant = true;
    public float ConstantValue;
    public FloatVariable Variable;

    public float Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
        
    }
}
