using UnityEngine;

[System.Serializable]
public class ColorVariableReference
{
    public bool UseConstant = true;
    public Color32 ConstantValue;
    public ColorVariable Variable;

    public Color32 Value {
        get {
            return UseConstant ? ConstantValue : Variable.Value;
        }
    }
}
