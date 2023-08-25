using UnityEngine;
using LitJson;
using System.Collections.Generic;
using System.IO;
using System;

public static class ItemDatabase {
    private static List<Item> database = new List<Item>();
    private static List<BaseItemTemplate> itemList = new List<BaseItemTemplate>();

    public static void Initialize(TextAsset data, TextAsset recipes) {


        JsonDataManager.SetTextAssets(data, recipes);

        itemList = JsonDataManager.LoadData();

        ConstructItemDatabase();
    }

    public static Item FetchItemById(int id) {

        for (int i = 0; i < database.Count; i++) {
            if (database[i].Id == id) {
                return database[i];
            }
        }

        return null;
    }


    public static BaseItemTemplate FetchBaseItemTemplateById(int id) {
        for (int i = 0; i < itemList.Count; i++) {
            if (Int16.Parse(itemList[i].Id) == id) {
                return itemList[i];
            }
        }

        return null;
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

            database.Add(newItem);
        }
    }

    // Function to save the database to JSON using JsonDataManager
    public static void SaveData() {
        List<BaseItemTemplate> itemTemplates = new List<BaseItemTemplate>();
        foreach (Item item in database) {
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
