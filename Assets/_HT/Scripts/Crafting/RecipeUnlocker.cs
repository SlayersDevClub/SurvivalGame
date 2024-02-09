using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;
using System;

/**
 * Determine what recipes are unlocked.
 */
[CreateAssetMenu]
public class RecipeUnlocker : ScriptableObject {
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

    public ItemDatabase itemDatabase;
    public GameObjectBoolRuntimeDict recipesUnlocked;

    public GameObject recipeCard;
    
    private void Start() {
        recipesUnlocked.Clear();
    }

    public GameObject CreateRecipeCard(RecipeTemplate recipe) {
        GameObject createdCard = Instantiate(recipeCard);

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
}
