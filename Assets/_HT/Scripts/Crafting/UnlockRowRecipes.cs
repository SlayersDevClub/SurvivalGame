using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UnlockRowRecipes : MonoBehaviour
{
    public int levelRowIsUnlocked;
    public GameObject recipeCardHolder;

    public List<RecipeTemplate> recipesInRow;
    public IntGameObjectRuntimeDict recipeRowsUnlocked;
    public GameObjectBoolRuntimeDict recipesUnlocked;
    public RecipeUnlocker recipeUnlocker;

    private void Start() {
        PopulateRecipeRow();
        LockLevel();
    }

    private void PopulateRecipeRow() {
        foreach (RecipeTemplate recipe in recipesInRow) {
            GameObject recipeInUnlockRow = recipeUnlocker.CreateRecipeCard(recipe);
            recipeInUnlockRow.transform.SetParent(recipeCardHolder.transform);

            recipesUnlocked.Add(recipeInUnlockRow, false);
        }
    }

    private void LockLevel() {
        GetComponent<CanvasGroup>().alpha = .25f;
    }

    public void UnlockLevel(int levelUnlocked) {
        if(levelRowIsUnlocked == levelUnlocked) {
            GetComponent<CanvasGroup>().alpha = 1f;
        }
    }


}
