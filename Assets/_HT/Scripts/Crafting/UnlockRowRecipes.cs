using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UnlockRowRecipes : MonoBehaviour
{
    public int levelRowIsUnlocked;
    public GameObject recipeCardHolder;

    public List<RecipeTemplate> recipesInRow;
    public IntGameObjectRuntimeDict recipeRowsUnlocked;
    public GameObjectBoolRuntimeDict recipeCardsUnlocked;
    public RecipeUnlocker recipeUnlocker;

    public CanvasGroup canvasGroup;

    private void Start() {
        PopulateRecipeRow();
    }

    private void PopulateRecipeRow() {
        foreach (RecipeTemplate recipe in recipesInRow) {
            GameObject recipeInUnlockRow = recipeUnlocker.CreateRecipeCard(recipe);
            recipeInUnlockRow.transform.SetParent(recipeCardHolder.transform);

            recipeCardsUnlocked.Add(recipeInUnlockRow, false);
        }
    }

    private void LockLevel() {
        canvasGroup.alpha = .25f;
    }

    public void UnlockLevel(int levelUnlocked) {
        Debug.Log("UNLOCKING LEVEL");
        if(levelRowIsUnlocked == levelUnlocked) {
            canvasGroup.alpha = 1f;
        }
    }


}
