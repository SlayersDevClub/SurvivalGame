using UnityEditor;
using UnityEngine;
using System.Collections.Generic;

public class CraftingTesterEditor : EditorWindow {

    private string searchQuery = "";
    private Vector2 scrollPosition;
    private BaseItemTemplate[] allItems;
    private List<BaseItemTemplate> selectedItems = new List<BaseItemTemplate>();
    private BaseItemTemplate outputItem;

    [MenuItem("Window/Crafting Tester")]
    public static void ShowWindow() {
        GetWindow<CraftingTesterEditor>("Crafting Tester");
    }

    private void OnEnable() {
        // Load all BaseItemTemplates from the specified path
        allItems = Resources.LoadAll<BaseItemTemplate>("GameComponents/Items");
        // Load the recipes from JSON into the CraftingBrain
        UpdateOutputItem(); // Update the output item initially
    }

    private void OnGUI() {
        GUILayout.Label("Crafting Tester", EditorStyles.boldLabel);

        // Search bar
        searchQuery = EditorGUILayout.TextField("Search", searchQuery);

        // Display all items that match the search query
        DisplayFilteredItems();

        // Show the selected items and the output item
        DisplaySelectedItems();

        // Clear button
        if (GUILayout.Button("Clear List")) {
            ClearSelectedItems();
        }
    }

    private void DisplayFilteredItems() {
        scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition, GUILayout.ExpandHeight(true));

        foreach (var item in allItems) {
            if (string.IsNullOrEmpty(searchQuery) || item.name.Contains(searchQuery)) {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField(item.name);

                if (GUILayout.Button("Add", GUILayout.Width(60))) {
                    AddItem(item);
                }

                EditorGUILayout.EndHorizontal();
            }
        }

        EditorGUILayout.EndScrollView();
    }

    private void DisplaySelectedItems() {
        GUILayout.Label("Selected Items:");

        foreach (var item in selectedItems) {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(item.name);
            EditorGUILayout.EndHorizontal();
        }

        EditorGUILayout.Space();

        // Display the output item
        EditorGUILayout.LabelField("Output:");
        if (outputItem != null) {
            EditorGUILayout.LabelField(outputItem.name);
        } else {
            EditorGUILayout.LabelField("No valid recipe found for the selected items.");
        }
    }

    private void AddItem(BaseItemTemplate item) {
        if (selectedItems.Count < 5) {
            selectedItems.Add(item);
            UpdateOutputItem();
        }
    }

    private void ClearSelectedItems() {
        selectedItems.Clear();
        UpdateOutputItem();
    }

    private void UpdateOutputItem() {
        //outputItem = CraftingBrain.CheckRecipe(selectedItems);
        Repaint();
    }

}
