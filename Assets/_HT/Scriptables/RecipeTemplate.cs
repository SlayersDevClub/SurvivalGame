using UnityEngine;

[System.Serializable]
public class RecipeTemplate : ScriptableObject {
    public BaseItemTemplate[] ingredients;
    public BaseItemTemplate output;

    public void Initialize(string recipeName, BaseItemTemplate[] ingredients, BaseItemTemplate output) {
        this.name = recipeName;
        this.ingredients = ingredients;
        this.output = output;
    }

    // Add other fields and methods for RecipeTemplate as needed
}
