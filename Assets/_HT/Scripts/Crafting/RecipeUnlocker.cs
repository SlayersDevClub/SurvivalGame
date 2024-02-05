using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
using System;

/**
 * Determine what recipes are unlocked.
 */
public class RecipeUnlocker : MonoBehaviour {
    /*
    
    

    

    private Dictionary<RecipeTemplate, GameObject> recipeAndCraftingCard = new Dictionary<RecipeTemplate, GameObject>();

   

    private void PopulateCraftingTableWithCraftables() {
        foreach (RecipeTemplate recipe in craftingBrain.recipes) {
            GameObject createdRecipeCard = CreateRecipeCard(recipe);

            recipeAndCraftingCard[recipe] = createdRecipeCard;
            ShowAsCraftableInTable(recipe, false);
        }
    }

    public void UpdateCraftableItemsInTable(Dictionary<int, int> itemsInInventory) {
        List<BaseItemTemplate> craftableItems = new List<BaseItemTemplate>();

        foreach (RecipeTemplate recipe in craftingBrain.recipes) {
            List<string> recipeItemIDs = recipe.ingredients.Select(ingredient => ingredient.Id).ToList();
            recipeItemIDs.Sort();

            if (IsCraftable(itemsInInventory, recipeItemIDs)) {
                craftableItems.Add(recipe.output);
                ShowAsCraftableInTable(recipe, true);
            }
        }

        // Now, craftableItems contains the list of items the player can craft.
        // You can use this information as needed, for example, to enable crafting UI elements.
    }

    private bool IsCraftable(Dictionary<int, int> playerInventory, List<string> recipeItemIDs) {
        // Check if player has all the required items for the recipe
        foreach (string itemId in recipeItemIDs) {
            int requiredQuantity = recipeItemIDs.Count(id => id == itemId);
            if (!playerInventory.ContainsKey(Convert.ToInt32(itemId)) || playerInventory[Convert.ToInt32(itemId)] < requiredQuantity) {
                return false;
            }
        }
        return true;
    }

    public void MakeRecipeCraftable(RecipeTemplate recipeToMakeCraftable) {
        GameObject createdRecipeCard = CreateRecipeCard(recipeToMakeCraftable);

        recipeAndCraftingCard[recipeToMakeCraftable] = createdRecipeCard;
        ShowAsCraftableInTable(recipeToMakeCraftable, false);
    }
    */

    public CraftingBrain craftingBrain;
    public ItemDatabase itemDatabase;
    public GameObjectBoolRuntimeDict recipesUnlocked;

    public GameObject recipeCard;
    public GridLayoutGroup recipeGrid;

    private void Start() {
        recipesUnlocked.Clear();
        PopulateCraftingUnlockables();
    }


    private void PopulateCraftingUnlockables() {
        foreach (RecipeTemplate recipe in craftingBrain.recipes) {
            GameObject createdRecipeCard = CreateRecipeCard(recipe);
            createdRecipeCard.transform.SetParent(recipeGrid.transform);
            //ShowAsCraftableInTable(recipe, false);
        }
    }

    private GameObject CreateRecipeCard(RecipeTemplate recipe) {
        GameObject createdCard = Instantiate(recipeCard, recipeGrid.transform);

        BaseItemTemplate item = itemDatabase.FetchBaseItemTemplateById(Int16.Parse(recipe.output.Id));

        if (item.icon != null) {
            Image createdCardImage = createdCard.transform.GetComponentInChildren<Image>();
            createdCardImage.sprite = item.icon;

        } else {
            // Handle the case where the icon is not set (e.g., assign a default sprite or do nothing)
            Debug.LogWarning("Recipe icon is not set!");
        }

        return createdCard;
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
            Debug.Log(opacity);
            Debug.Log(recipeCard.gameObject.name);
            Image recipeCardImage = recipeCard.transform.GetComponentInChildren<Image>();

            // Get the current color of the sprite
            Color spriteColor = recipeCardImage.color;

            // Set the alpha component to 75% (0.75)
            spriteColor.a = opacity;

            // Apply the modified color back to the sprite
            recipeCardImage.color = spriteColor;
        }
    }
}
