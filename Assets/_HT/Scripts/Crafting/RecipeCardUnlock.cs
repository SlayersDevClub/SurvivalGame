using UnityEngine.UI;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class RecipeCardUnlock : MonoBehaviour, IPointerClickHandler {
    public RecipeTemplate recipe;
    public int recipeUnlockCost;

    public GameObjectBoolRuntimeDict recipeCardsUnlocked;
    public IntVariableReference recipeUnlockPoints;
    public RecipeRuntimeSet recipesUnlocked;

    private void OnEnable() {
        recipeCardsUnlocked.Add(gameObject, false);
        RecipeUnlocked(gameObject, false);
        SetCostText();
    }

    public void OnPointerClick(PointerEventData eventData) {
        if(recipeUnlockPoints.Value >= recipeUnlockCost && !recipeCardsUnlocked.GetValue(gameObject)) {
            recipeCardsUnlocked.Add(gameObject, true);
            recipesUnlocked.Add(recipe);
            RecipeUnlocked(gameObject, true);
            recipeUnlockPoints.Value -= recipeUnlockCost;
        }
    }

    public void RecipeUnlocked(GameObject recipeCard, bool unlocked) {
        float notUnlockedOpacity = 0.5f;
        float unlockedOpacity = 255f;

        if (unlocked) {
            ChangeImageOpacity(recipeCard, unlockedOpacity);
        } else {
            ChangeImageOpacity(recipeCard, notUnlockedOpacity);
        }

        void ChangeImageOpacity(GameObject recipeCard, float opacity) {
            Image recipeCardImage = recipeCard.transform.GetComponentInChildren<Image>();

            // Get the current color of the sprite
            Color spriteColor = recipeCardImage.color;

            // Set the alpha component to 75% (0.75)
            spriteColor.a = opacity;

            // Apply the modified color back to the sprite
            recipeCardImage.color = spriteColor;
        }
    }

    private void SetCostText() {
        GetComponentInChildren<TextMeshProUGUI>().text = recipeUnlockCost.ToString();
    }

}
