using UnityEngine;

[System.Serializable]
public class GridVariableReference
{
    public bool UseConstant = true;
    public Grid ConstantValue;
    public GridVariable Variable;

    public Grid Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
        
    }
}
