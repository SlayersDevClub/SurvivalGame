using UnityEditor;
using UnityEngine;
using System.Collections.Generic;

public class ModMenu : EditorWindow {
    private string searchQuery = "";
    private Vector2 scrollPosition;
    private BaseItemTemplate[] allItems;

    private PlayerInputReader playerInputReader;
    public static Inventory inventory;

    [MenuItem("Window/Mod Menu")]
    public static void ShowWindow() {
        GetWindow<ModMenu>("Mod Menu");

    }

    private void OnEnable() {
        // Load all BaseItemTemplates from the specified path
        allItems = JsonDataManager.LoadData().ToArray();
        inventory = FindObjectOfType<PlayerInputReader>().inventory;

    }

    private void OnGUI() {
        inventory = FindObjectOfType<PlayerInputReader>().inventory;

        GUILayout.Label("Mod Menu", EditorStyles.boldLabel);

        // Search bar
        searchQuery = EditorGUILayout.TextField("Search", searchQuery).ToLower();

        // Display all items that match the search query
        DisplayFilteredItems();

    }

    private void DisplayFilteredItems() {
        scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, GUILayout.ExpandHeight(true));

        foreach (var item in allItems) {
            if (string.IsNullOrEmpty(searchQuery) || item.name.ToLower().Contains(searchQuery)) {
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
        inventory.AddItem(int.Parse(item.Id));
    }

}
