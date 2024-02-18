using UnityEngine;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
public static class JsonDataManager {
    private static string SaveFilePath => Application.persistentDataPath + "/data.json";

    private static string RecipeSaveFilePath => Application.persistentDataPath + "/recipes.json";


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
        string jsonToSave = JsonConvert.SerializeObject(wrapper, Formatting.Indented,
            new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.Auto, // Include type information in the JSON
            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });

        File.WriteAllText(SaveFilePath, jsonToSave);
    }

    public static List<BaseItemTemplate> LoadData() {
        string jsonToLoad = File.ReadAllText(SaveFilePath);

        ItemTemplateWrapper wrapper = JsonConvert.DeserializeObject<ItemTemplateWrapper>(jsonToLoad,
            new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.Auto // Allow type information to be used during deserialization
        });

        foreach (BaseItemTemplate item in wrapper.items) {
            if (item is PickaxeHandleTemplate) {
            }
            try {
                item.prefab = Resources.Load<GameObject>(item.prefabString);
                item.icon = Resources.Load<Sprite>(item.slug);
            } catch {

            }
        }

        return wrapper.items;
    }


    public static List<RecipeTemplate> LoadRecipeData() {

            string jsonToLoad = File.ReadAllText(RecipeSaveFilePath);
        
            RecipeTemplateWrapper wrapper = JsonConvert.DeserializeObject<RecipeTemplateWrapper>(jsonToLoad, new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.Auto // Allow type information to be used during deserialization
            });
            return wrapper.recipes;
    }

    public static void SaveRecipeData(List<RecipeTemplate> recipes) {
        RecipeTemplateWrapper wrapper = new RecipeTemplateWrapper(recipes);
        string jsonToSave = JsonConvert.SerializeObject(wrapper, Formatting.Indented,
            new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.Auto, // Include type information in the JSON
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });

        File.WriteAllText(RecipeSaveFilePath, jsonToSave);
    }
}

[System.Serializable]
public class ItemTemplateWrapper {
    public List<BaseItemTemplate> items;

    public ItemTemplateWrapper() {
        items = new List<BaseItemTemplate>();
    }

    public ItemTemplateWrapper(List<BaseItemTemplate> itemList) {
        items = itemList;
    }
}

[System.Serializable]
public class RecipeTemplateWrapper {
    public List<RecipeTemplate> recipes;

    public RecipeTemplateWrapper() {
        recipes = new List<RecipeTemplate>();
    }

    public RecipeTemplateWrapper(List<RecipeTemplate> recipeList) {
        recipes = recipeList;
    }
}

