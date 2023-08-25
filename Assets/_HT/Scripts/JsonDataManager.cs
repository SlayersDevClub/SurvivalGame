using UnityEngine;
using System.Collections.Generic;
using System.IO;

public static class JsonDataManager {
    private static string SaveFilePath = Application.persistentDataPath + "/data.json";
    private static string RecipeSaveFilePath = Application.persistentDataPath + "/recipes.json";

    public static void SetTextAssets(TextAsset data, TextAsset recipes) {
        dataAsset = data;
        recipeAsset = recipes;
    }

    private static TextAsset dataAsset;
    private static TextAsset recipeAsset;

    public static void AddBaseItemTemplateToJson(BaseItemTemplate baseItemTemplate) {
        // Load existing data from JSON
        List<BaseItemTemplate> existingData = LoadData();

        // Add the new baseItemTemplate to the list
        existingData.Add(baseItemTemplate);

        // Save the updated data to JSON
        SaveData(existingData);
    }

    public static void SaveData(List<BaseItemTemplate> data) {
        ItemTemplateWrapper wrapper = new ItemTemplateWrapper(data);
        string jsonToSave = JsonUtility.ToJson(wrapper);
        File.WriteAllText(SaveFilePath, jsonToSave);
    }

    public static List<BaseItemTemplate> LoadData() {
        if (File.Exists(SaveFilePath)) {
            string jsonToLoad = File.ReadAllText(SaveFilePath);
            ItemTemplateWrapper wrapper = JsonUtility.FromJson<ItemTemplateWrapper>(jsonToLoad);
            return wrapper.items;
        }
        return new List<BaseItemTemplate>();
    }

    public static List<RecipeTemplate> LoadRecipeData() {
        if (File.Exists(RecipeSaveFilePath)) {
            string jsonToLoad = File.ReadAllText(RecipeSaveFilePath);
            RecipeTemplateWrapper wrapper = JsonUtility.FromJson<RecipeTemplateWrapper>(jsonToLoad);
            return wrapper.recipes;
        }
        return new List<RecipeTemplate>();
    }

    public static void SaveRecipeData(List<RecipeTemplate> recipes) {
        RecipeTemplateWrapper wrapper = new RecipeTemplateWrapper(recipes);
        string jsonToSave = JsonUtility.ToJson(wrapper);
        File.WriteAllText(RecipeSaveFilePath, jsonToSave);
    }
}

[System.Serializable]
public class ItemTemplateWrapper {
    public List<BaseItemTemplate> items;

    public ItemTemplateWrapper(List<BaseItemTemplate> itemList) {
        items = itemList;
    }
}

[System.Serializable]
public class RecipeTemplateWrapper {
    public List<RecipeTemplate> recipes;

    public RecipeTemplateWrapper(List<RecipeTemplate> recipeList) {
        recipes = recipeList;
    }
}
