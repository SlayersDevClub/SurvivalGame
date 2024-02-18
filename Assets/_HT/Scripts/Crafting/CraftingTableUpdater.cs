using UnityEngine;
using System.Collections.Generic;
using UnityEngine.UI;
using System;
public class CraftingTableUpdater : MonoBehaviour
{
    private Dictionary<RecipeTemplate, GameObject> recipeAndCraftingCard = new Dictionary<RecipeTemplate, GameObject>();

    public GameObject craftingCard;
    public GameObjectBoolRuntimeDict craftableCraftingCards;
    public IntIntRuntimeDict itemsInInventory;
    public CraftingBrain craftingBrain;
    public ItemDatabase itemDatabase;

    public RecipeRuntimeSet recipesUnlocked;
    private void Start() {
        PopulateCraftingCards();
    }

    private void PopulateCraftingCards() {
        foreach(RecipeTemplate recipe in craftingBrain.recipes) {
            GameObject createdCraftingCard = CreateCraftingCard(recipe);
            createdCraftingCard.transform.SetParent(gameObject.transform);

            craftableCraftingCards.Add(createdCraftingCard, false);
            recipeAndCraftingCard[recipe] = createdCraftingCard;
        }
    }

    private GameObject CreateCraftingCard(RecipeTemplate recipe) {
        GameObject createdCard = Instantiate(craftingCard);
        createdCard.GetComponent<CraftingCard>().recipe = recipe;

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

    public void UpdateCraftableRecipes(RecipeTemplate recipeStatus) {
        //Recipe that is craftable added
        if (recipesUnlocked.Contains(recipeStatus)){
            craftableCraftingCards.Add(recipeAndCraftingCard[recipeStatus], true);
        }
        //Recipe is no longer craftable
        else {
            craftableCraftingCards.Add(recipeAndCraftingCard[recipeStatus], false);
        }
    }

    public void UpdateCraftableRecipes() {
        List<RecipeTemplate> craftableItems = craftingBrain.GetCraftableItems(itemsInInventory.itemDictionary);
        List<GameObject> currentCraftableCards = craftableCraftingCards.GetKeys();

        foreach(GameObject craftableCard in currentCraftableCards) {
            craftableCraftingCards.Add(craftableCard, false);
        }

        foreach(RecipeTemplate recipe in craftableItems) {
            craftableCraftingCards.Clear();
            craftableCraftingCards.Add(recipeAndCraftingCard[recipe], true);
        }
    }

}
