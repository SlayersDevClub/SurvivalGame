using UnityEngine;
using LitJson;
using System.Collections.Generic;
using System.IO;
using System;

public static class ItemDatabase {

    private static List<BaseItemTemplate> itemList = new List<BaseItemTemplate>();

    private static Dictionary<int, Item> itemDict = new Dictionary<int, Item>();
    private static Dictionary<int, BaseItemTemplate> baseItemDict = new Dictionary<int, BaseItemTemplate>();

    public static void Initialize() {
        itemList = JsonDataManager.LoadData();
        ConstructItemDatabase();
    }
    public static Item FetchItemById(int id) {
        if (itemDict.ContainsKey(id)) {
            return itemDict[id];
        } else {
            return null;
        }
    }


    public static BaseItemTemplate FetchBaseItemTemplateById(int id) {
        if (baseItemDict.ContainsKey(id)) {
            return baseItemDict[id];
        } else {
            return null;
        }
    }

    public static void AddBaseItemTemplate(BaseItemTemplate newTemplate) {
        Item newItem = new Item();
        newItem.Id = Int16.Parse(newTemplate.Id);
        newItem.Title = newTemplate.itemName;
        newItem.Description = newTemplate.description;
        newItem.Stackable = newTemplate.stackable;
        newItem.Sprite = newTemplate.icon;

        baseItemDict[Int16.Parse(newTemplate.Id)] = newTemplate;
        itemDict[newItem.Id] = newItem;

    }



    private static void ConstructItemDatabase() {
        for (int i = 0; i < itemList.Count; i++) 
            {
            Item newItem = new Item();
            newItem.Id = Int16.Parse(itemList[i].Id);
            newItem.Title = itemList[i].itemName;
            newItem.Description = itemList[i].description;
            newItem.Stackable = itemList[i].stackable;
            newItem.Sprite = itemList[i].icon;

            itemDict[newItem.Id] = newItem;
            baseItemDict[newItem.Id] = itemList[i];
            //database.Add(newItem);
            if (itemList[i] as GunTemplate != null || itemList[i] as ToolTemplate != null) {
                LoadCustomObject(itemList[i], itemList[i].Id, newItem);
            }
        }
    }

    private static void LoadCustomObject(BaseItemTemplate customItem, string id, Item newItem) {
        if (customItem is ToolTemplate) {
            ToolTemplate customTool = customItem as ToolTemplate;

            for (int i = 0; i < customTool.partPrefabPaths.Length; i++) {
                customTool.partPrefabPaths[i].prefab = Resources.Load<GameObject>(customTool.partPrefabPaths[i].prefabString);
            }

            List<BaseItemTemplate> itemTemplates = new List<BaseItemTemplate>();

            for (int i = 0; i < customTool.partPrefabPaths.Length; i++) {
                itemTemplates.Add(customTool.partPrefabPaths[i]);
            }

            // Attempt to build the tool using the list of item templates
            ToolTemplate loadedTool = CraftingBrain.AttemptBuildTool(itemTemplates, id) as ToolTemplate;
            customTool.prefab = loadedTool.prefab;
            customTool.icon = loadedTool.icon;
            newItem.Sprite = customTool.icon;
        } else if (customItem as GunTemplate != null) {
            GunTemplate customGun = customItem as GunTemplate;

            for (int i = 0; i < customGun.partPrefabPaths.Length; i++) {
                customGun.partPrefabPaths[i].prefab = Resources.Load<GameObject>(customGun.partPrefabPaths[i].prefabString);
            }

            List<BaseItemTemplate> itemTemplates = new List<BaseItemTemplate>();

            for (int i = 0; i < customGun.partPrefabPaths.Length; i++) {
                itemTemplates.Add(customGun.partPrefabPaths[i]);
            }

            // Attempt to build the tool using the list of item templates
            GunTemplate loadedGun = CraftingBrain.AttemptBuildGun(itemTemplates, id) as GunTemplate;
            customGun.prefab = loadedGun.prefab;
            customGun.icon = loadedGun.icon;
            newItem.Sprite = customGun.icon;
        }
    }

    // Function to save the database to JSON using JsonDataManager
    public static void SaveData() {
        List<BaseItemTemplate> itemTemplates = new List<BaseItemTemplate>();
        foreach (Item item in itemDict.Values) {
            BaseItemTemplate template = new BaseItemTemplate();
            template.Id = item.Id.ToString();
            template.itemName = item.Title;
            template.description = item.Description;
            template.stackable = item.Stackable;
            template.icon = item.Sprite;
            itemTemplates.Add(template);
        }

        JsonDataManager.SaveData(itemTemplates);
    }
}

public class Item {
    public int Id { get; set; }
    public string Title { get; set; }
    public int Value { get; set; }
    public int Power { get; set; }
    public int Defense { get; set; }
    public int Vitality { get; set; }
    public string Description { get; set; }
    public bool Stackable { get; set; }
    public int Rarity { get; set; }
    public string Slug { get; set; }
    public Sprite Sprite { get; set; }

    public Item() {
        this.Id = -1;
    }
}
