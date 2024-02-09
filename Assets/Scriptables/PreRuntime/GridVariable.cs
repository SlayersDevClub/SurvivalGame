using UnityEngine;

[CreateAssetMenu(menuName = "Variables/Grid")]
public class GridVariable : ScriptableObject
{
    public GridChangedEvent onValueChanged;
    public Grid Value;

    /*private void OnValidate() {
        onValueChanged.Raise(Value);
    }*/
}
