using UnityEngine;
using LitJson;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System;

public class ItemDatabase : MonoBehaviour {
    private List<Item> database = new List<Item>();
    private List<BaseItemTemplate> itemList = new List<BaseItemTemplate>();

    void Start() {
        // Load data from JSON using JsonDataManager
        itemList = JsonDataManager.LoadData();
        ConstructItemDatabase();
    }

    public Item FetchItemById(int id) {
        for (int i = 0; i < database.Count; i++) {
            if (database[i].Id == id) {
                return database[i];
            }
        }

        return null;
    }

    void ConstructItemDatabase() {
        for (int i = 0; i < itemList.Count; i++) {
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
    private void SaveData() {
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

// Rest of the code remains the same...




public static class JsonDataManager {
	private static string SaveFilePath = Application.persistentDataPath + "/data.json";
    
	public static void SaveData(List<BaseItemTemplate> data) {
       
        string jsonToSave = JsonUtility.ToJson(new ItemTemplateWrapper(data));
		File.WriteAllText(SaveFilePath, jsonToSave);
	}

	public static List<BaseItemTemplate> LoadData() {
        Debug.Log(SaveFilePath);
        if (File.Exists(SaveFilePath)) {
			string jsonToLoad = File.ReadAllText(SaveFilePath);
			ItemTemplateWrapper wrapper = JsonUtility.FromJson<ItemTemplateWrapper>(jsonToLoad);
			return wrapper.items;
		} else {
			return new List<BaseItemTemplate>();
		}
	}
}

[System.Serializable]
public class ItemTemplateWrapper {
	public List<BaseItemTemplate> items;

	public ItemTemplateWrapper(List<BaseItemTemplate> itemList) {
		items = itemList;
	}
}
