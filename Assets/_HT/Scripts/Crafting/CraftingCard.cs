using UnityEngine.UI;
using UnityEngine;

public class CraftingCard : MonoBehaviour
{
    public RecipeTemplate recipe;

    public void ShowCardToBeCrafted(GameObject cardToCraft, bool craftable) {
        if(cardToCraft == gameObject) {
            if (craftable) ShowCard();
            else HideCard();
        } 
    }

    private void ShowCard() {
        Image imageComponent = GetComponentInChildren<Image>();
        Color newColor = imageComponent.color;
        newColor.a = 1f; // Set the alpha value to a low opacity, adjust as needed (0 is fully transparent, 1 is fully opaque)
        imageComponent.color = newColor;
    }
    private void HideCard() {
        Image imageComponent = GetComponentInChildren<Image>();
        Color newColor = imageComponent.color;
        newColor.a = 0.5f; // Set the alpha value to a low opacity, adjust as needed (0 is fully transparent, 1 is fully opaque)
        imageComponent.color = newColor;
    }
}
