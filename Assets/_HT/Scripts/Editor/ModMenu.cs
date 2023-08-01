using UnityEditor;
using UnityEngine;
using System.Collections.Generic;

public class ModMenu : EditorWindow {
    private string searchQuery = "";
    private Vector2 scrollPosition;
    private BaseItemTemplate[] allItems;
    private List<BaseItemTemplate> selectedItems = new List<BaseItemTemplate>();
    private BaseItemTemplate outputItem;

    public Inventory inv;

    [MenuItem("Window/Mod Menu")]
    public static void ShowWindow() {
        GetWindow<ModMenu>("Mod Menu");
    }

    private void OnEnable() {
        // Load all BaseItemTemplates from the specified path
        allItems = Resources.LoadAll<BaseItemTemplate>("GameComponents/Items");
    }

    private void OnGUI() {
        GUILayout.Label("Mod Menu", EditorStyles.boldLabel);

        // Search bar
        searchQuery = EditorGUILayout.TextField("Search", searchQuery);

        // Display all items that match the search query
        DisplayFilteredItems();

    }

    private void DisplayFilteredItems() {
        scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, GUILayout.ExpandHeight(true));

        foreach (var item in allItems) {
            if (string.IsNullOrEmpty(searchQuery) || item.name.Contains(searchQuery)) {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField(item.name);

                if (GUILayout.Button("Add", GUILayout.Width(60))) {
                    SpawnItem(item);
                }

                EditorGUILayout.EndHorizontal();
            }
        }

        EditorGUILayout.EndScrollView();
    }

    private void SpawnItem(BaseItemTemplate item) {
        inv = GameObject.Find("Inventory").GetComponent<Inventory>();
        inv.AddItem(int.Parse(item.Id));
    }

}
