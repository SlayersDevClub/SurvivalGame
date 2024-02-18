using UnityEngine;

[System.Serializable]
public class GameObjectVariableReference
{
    public bool UseConstant = true;
    public GameObject ConstantValue;
    public GameObjectVariable Variable;

    public GameObject Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
        set {
            Variable.Value = value;
            Variable.onValueChanged.Raise(value);
        }
        
    }
}
