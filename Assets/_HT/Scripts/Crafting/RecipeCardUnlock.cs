using UnityEngine.UI;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class RecipeCardUnlock : MonoBehaviour, IPointerClickHandler {
    public int recipeUnlockCost;

    public GameObjectBoolRuntimeDict recipesUnlocked;
    public IntVariableReference recipeUnlockPoints;

    private void OnEnable() {
        recipesUnlocked.Add(gameObject, false);
        RecipeUnlocked(gameObject, false);
        SetCostText();
    }

    public void OnPointerClick(PointerEventData eventData) {
        if(recipeUnlockPoints.Value >= recipeUnlockCost && !recipesUnlocked.GetValue(gameObject)) {
            recipesUnlocked.Add(gameObject, true);
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
