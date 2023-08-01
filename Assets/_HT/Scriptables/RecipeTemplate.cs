using UnityEngine;

[System.Serializable]
public class RecipeTemplate : ScriptableObject {
    public BaseItemTemplate[] ingredients;
    public BaseItemTemplate output;
}
