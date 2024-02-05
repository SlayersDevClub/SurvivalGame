using UnityEngine;
using LitJson;
using System.Collections.Generic;
using System.IO;
using System;
using UnityEngine.UI;

[CreateAssetMenu]
public class ItemDatabase : ScriptableObject {
    //public static ItemDatabase instance;

    public GameObject itemPrefab;
    public CraftingBrain craftingBrain;

    private List<BaseItemTemplate> itemList = new List<BaseItemTemplate>();

    private Dictionary<int, Item> itemDict = new Dictionary<int, Item>();
    private Dictionary<int, BaseItemTemplate> baseItemDict = new Dictionary<int, BaseItemTemplate>();

    private void OnEnable() {
        itemList = JsonDataManager.LoadData();
        ConstructItemDatabase();
    }
    public Item FetchItemById(int id) {
        if (itemDict.ContainsKey(id)) {
            return itemDict[id];
        } else {
            return null;
        }
    }


    public BaseItemTemplate FetchBaseItemTemplateById(int id) {
        if (baseItemDict.ContainsKey(id)) {
            return baseItemDict[id];
        } else {
            return null;
        }
    }

    public GameObject FetchItemGameObject(BaseItemTemplate item) {
        GameObject itemCreated = GameObject.Instantiate(itemPrefab);
        itemCreated.GetComponent<Image>().sprite = item.icon;
        itemCreated.GetComponent<ItemData>().item = item;
        return itemCreated;
    }

    public void AddBaseItemTemplate(BaseItemTemplate baseItemTemplateToAdd) {
        int itemID = Int16.Parse(baseItemTemplateToAdd.Id);

        baseItemDict[itemID] = baseItemTemplateToAdd;
    }



    private void ConstructItemDatabase() {
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

    private void LoadCustomObject(BaseItemTemplate customItem, string id, Item newItem) {
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
            ToolTemplate loadedTool = craftingBrain.AttemptBuildTool(itemTemplates, id) as ToolTemplate;
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
            GunTemplate loadedGun = craftingBrain.AttemptBuildGun(itemTemplates, id) as GunTemplate;
            customGun.prefab = loadedGun.prefab;
            customGun.icon = loadedGun.icon;
            newItem.Sprite = customGun.icon;
        }
    }

    // Function to save the database to JSON using JsonDataManager
    public void SaveData() {
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
