/*using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class ModuleCreatorEditorWindow : EditorWindow {
    private GameModuleCreator.ModuleType selectedModuleType;
    private GameModuleCreator.ItemSubType selectedItemSubType;
    private GameModuleCreator.EnemySubType selectedEnemySubType;
    private string searchQuery = "";
    private Vector2 scrollPosition;

    private List<EnemyTemplate> filteredEnemyTemplates = new List<EnemyTemplate>();
    private EnemyTemplate selectedEnemyTemplate;

    private List<ConsumableTemplate> filteredConsumableTemplates = new List<ConsumableTemplate>();
    private ConsumableTemplate selectedConsumableTemplate;

    private List<ResourceTemplate> filteredResourceTemplates = new List<ResourceTemplate>();
    private ResourceTemplate selectedResourceTemplate;

    private List<RecipeTemplate> filteredRecipeTemplates = new List<RecipeTemplate>();
    private RecipeTemplate selectedRecipeTemplate;

    [MenuItem("Window/Module Creator Editor")]
    public static void ShowWindow() {
        GetWindow<ModuleCreatorEditorWindow>("Module Creator");
    }

    private void OnGUI() {
        EditorGUILayout.BeginHorizontal();
        DrawModuleTypeDropDown();
        DrawSubTypeDropDown();
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();

        searchQuery = EditorGUILayout.TextField("Search by Name:", searchQuery);

        EditorGUILayout.Space();

        scrollPosition = EditorGUILayout.BeginScrollView(scrollPosition);

        if (selectedModuleType == GameModuleCreator.ModuleType.Enemy) {
            DrawEnemyTemplateFields();
        } else if (selectedModuleType == GameModuleCreator.ModuleType.Item && selectedItemSubType == GameModuleCreator.ItemSubType.Consumables) {
            DrawConsumableTemplateFields();
        } else if (selectedModuleType == GameModuleCreator.ModuleType.Item && selectedItemSubType == GameModuleCreator.ItemSubType.Resources) {
            DrawResourceTemplateFields();
        } else if (selectedModuleType == GameModuleCreator.ModuleType.Recipes) {
            DrawRecipeTemplateFields();
        }

        // Add other module types and their fields here

        EditorGUILayout.EndScrollView();
    }

    private void DrawModuleTypeDropDown() {
        selectedModuleType = (GameModuleCreator.ModuleType)EditorGUILayout.EnumPopup("Module Type", selectedModuleType);
    }

    private void DrawSubTypeDropDown() {
        if (selectedModuleType == GameModuleCreator.ModuleType.Item) {
            selectedItemSubType = (GameModuleCreator.ItemSubType)EditorGUILayout.EnumPopup("Item Sub Type", selectedItemSubType);
        } else if (selectedModuleType == GameModuleCreator.ModuleType.Enemy) {
            selectedEnemySubType = (GameModuleCreator.EnemySubType)EditorGUILayout.EnumPopup("Enemy Sub Type", selectedEnemySubType);
        }

        // Add other subtypes as needed for different module types
    }

    private void DrawEnemyTemplateFields() {
        EditorGUILayout.LabelField("Enemy Template:");

        // Search and filter the EnemyTemplates based on the search query
        UpdateFilteredEnemyTemplates();

        for (int i = 0; i < filteredEnemyTemplates.Count; i++) {
            DrawEnemyTemplate(filteredEnemyTemplates[i], i);
            EditorGUILayout.Space();
        }

        if (selectedEnemySubType == GameModuleCreator.EnemySubType.Normal) {
            DrawCreateButton();
        }
    }

    private void UpdateFilteredEnemyTemplates() {
        filteredEnemyTemplates.Clear();
        EnemyTemplate[] allEnemyTemplates = Resources.LoadAll<EnemyTemplate>("GameComponents/Enemies/Normal");
        Debug.Log("RESORUCES LOADED = " + allEnemyTemplates.Length.ToString());

        foreach (EnemyTemplate enemyTemplate in allEnemyTemplates) {
            if (string.IsNullOrEmpty(searchQuery) || enemyTemplate.name.Contains(searchQuery)) {
                filteredEnemyTemplates.Add(enemyTemplate);
            }
        }
    }

    private void DrawEnemyTemplate(EnemyTemplate enemyTemplate, int index) {
        EditorGUILayout.BeginHorizontal();

        GUIStyle style = new GUIStyle(GUI.skin.button);
        if (enemyTemplate == selectedEnemyTemplate) {
            style.normal.textColor = Color.yellow;
        }

        if (GUILayout.Button(enemyTemplate.name, style)) {
            selectedEnemyTemplate = enemyTemplate;
        }

        if (GUILayout.Button("Edit")) {
            Selection.activeObject = enemyTemplate;
        }

        if (GUILayout.Button("Delete")) {
            DeleteEnemyTemplate(index);
        }

        EditorGUILayout.EndHorizontal();

        if (enemyTemplate == selectedEnemyTemplate) {
            EditorGUI.BeginChangeCheck();
            enemyTemplate.name = EditorGUILayout.TextField("Name", enemyTemplate.name);
            enemyTemplate.health = EditorGUILayout.IntField("Health", enemyTemplate.health);

            // Add other fields for EnemyTemplate as needed

            if (EditorGUI.EndChangeCheck()) {
                // No need to call SaveEnemyTemplate here
            }
        }
    }

    private string newTemplateName = "New Enemy";
    private int newTemplateHealth = 100;
    private bool showCreateFields = false;

    private void DrawCreateButton() {
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        if (!showCreateFields) {
            if (GUILayout.Button("Create")) {
                showCreateFields = true;
            }
        } else {
            newTemplateName = EditorGUILayout.TextField("Name", newTemplateName);
            newTemplateHealth = EditorGUILayout.IntField("Health", newTemplateHealth);

            // Add other fields for EnemyTemplate as needed

            EditorGUILayout.BeginVertical();

            if (GUILayout.Button("Save")) {
                CreateNewEnemyTemplate(newTemplateName, newTemplateHealth);
                SaveEnemyTemplate();
                showCreateFields = false;
            }

            if (GUILayout.Button("Cancel")) {
                showCreateFields = false;
            }

            EditorGUILayout.EndVertical();
        }

        GUI.enabled = selectedEnemyTemplate != null;



        GUI.enabled = true;

        EditorGUILayout.EndHorizontal();
    }

    private void DeleteEnemyTemplate(int index) {
        if (index >= 0 && index < filteredEnemyTemplates.Count) {
            EnemyTemplate enemyTemplate = filteredEnemyTemplates[index];
            if (enemyTemplate != null) {
                string path = AssetDatabase.GetAssetPath(enemyTemplate);
                AssetDatabase.DeleteAsset(path);

                // Set selectedEnemyTemplate to the deleted template (if it's the currently selected one)
                if (selectedEnemyTemplate == enemyTemplate) {
                    selectedEnemyTemplate = null;
                }

                filteredEnemyTemplates.RemoveAt(index);

                Debug.Log("EnemyTemplate deleted.");
            }
        }
    }

    private void CreateNewEnemyTemplate(string newTemplateName, int health) {
        int templateCount = 1;

        // Find a unique name for the new EnemyTemplate
        while (filteredEnemyTemplates.Exists(t => t.name == newTemplateName)) {
            newTemplateName = $"New Enemy {templateCount}";
            templateCount++;
        }

        // Create a new EnemyTemplate object with the default name
        selectedEnemyTemplate = CreateInstance<EnemyTemplate>();
        selectedEnemyTemplate.name = newTemplateName;
        selectedEnemyTemplate.health = health;

        if (selectedEnemyTemplate != null) {
            // Create the new EnemyTemplate asset with the specified name
            AssetDatabase.CreateAsset(selectedEnemyTemplate, $"Assets/Resources/GameComponents/Enemies/Normal/{selectedEnemyTemplate.name}.asset");
            AssetDatabase.SaveAssets();

            Debug.Log("EnemyTemplate created and saved!");
        }

        Debug.Log("New EnemyTemplate created.");
    }

    private void SaveEnemyTemplate() {
        if (selectedEnemyTemplate != null) {
            // Get the path of the existing asset
            string path = AssetDatabase.GetAssetPath(selectedEnemyTemplate);

            // If the name has changed, update the asset's file name
            if (selectedEnemyTemplate.name != System.IO.Path.GetFileNameWithoutExtension(path)) {
                string directory = System.IO.Path.GetDirectoryName(path);
                string newFileName = $"{selectedEnemyTemplate.name}.asset";
                string newPath = System.IO.Path.Combine(directory, newFileName);
                AssetDatabase.RenameAsset(path, newFileName);

                // Refresh the asset database to apply the changes
                AssetDatabase.Refresh();
            }

            EditorUtility.SetDirty(selectedEnemyTemplate);
            AssetDatabase.SaveAssets();

            Debug.Log("EnemyTemplate updated and saved!");
        }
    }

    private void DrawConsumableTemplateFields() {
        EditorGUILayout.LabelField("Consumable Template:");

        // Search and filter the ConsumableTemplates based on the search query
        UpdateFilteredConsumableTemplates();

        for (int i = 0; i < filteredConsumableTemplates.Count; i++) {
            DrawConsumableTemplate(filteredConsumableTemplates[i], i);
            EditorGUILayout.Space();
        }

        if (selectedItemSubType == GameModuleCreator.ItemSubType.Consumables) {
            DrawCreateButtonConsumable();
        }
    }

    private void UpdateFilteredConsumableTemplates() {
        filteredConsumableTemplates.Clear();
        ConsumableTemplate[] allConsumableTemplates = Resources.LoadAll<ConsumableTemplate>("GameComponents/Items/Consumables");

        foreach (ConsumableTemplate consumableTemplate in allConsumableTemplates) {
            if (string.IsNullOrEmpty(searchQuery) || consumableTemplate.name.Contains(searchQuery)) {
                filteredConsumableTemplates.Add(consumableTemplate);
            }
        }
    }

    private void DrawConsumableTemplate(ConsumableTemplate consumableTemplate, int index) {
        EditorGUILayout.BeginHorizontal();

        GUIStyle style = new GUIStyle(GUI.skin.button);
        if (consumableTemplate == selectedConsumableTemplate) {
            style.normal.textColor = Color.yellow;
        }

        if (GUILayout.Button(consumableTemplate.name, style)) {
            selectedConsumableTemplate = consumableTemplate;
        }

        if (GUILayout.Button("Edit")) {
            Selection.activeObject = consumableTemplate;
        }

        if (GUILayout.Button("Delete")) {
            DeleteConsumableTemplate(index);
        }

        EditorGUILayout.EndHorizontal();

        if (consumableTemplate == selectedConsumableTemplate) {
            EditorGUI.BeginChangeCheck();
            consumableTemplate.name = EditorGUILayout.TextField("Name", consumableTemplate.name);
            consumableTemplate.potency = EditorGUILayout.IntField("Potency", consumableTemplate.potency);

            // Add other fields for ConsumableTemplate as needed

            if (EditorGUI.EndChangeCheck()) {
                // No need to call SaveConsumableTemplate here
            }
        }
    }

    private string newConsumableName = "New Consumable";
    private int newConsumablePotency = 10;
    private bool showCreateFieldsConsumable = false;

    private void DrawCreateButtonConsumable() {
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        if (!showCreateFieldsConsumable) {
            if (GUILayout.Button("Create")) {
                showCreateFieldsConsumable = true;
            }
        } else {
            newConsumableName = EditorGUILayout.TextField("Name", newConsumableName);
            newConsumablePotency = EditorGUILayout.IntField("Potency", newConsumablePotency);

            // Add other fields for ConsumableTemplate as needed

            EditorGUILayout.BeginVertical();

            if (GUILayout.Button("Save")) {
                CreateNewConsumableTemplate(newConsumableName, newConsumablePotency);
                SaveConsumableTemplate();
                showCreateFieldsConsumable = false;
            }

            if (GUILayout.Button("Cancel")) {
                showCreateFieldsConsumable = false;
            }

            EditorGUILayout.EndVertical();
        }

        GUI.enabled = selectedConsumableTemplate != null;

        GUI.enabled = true;

        EditorGUILayout.EndHorizontal();
    }

    private void DeleteConsumableTemplate(int index) {
        if (index >= 0 && index < filteredConsumableTemplates.Count) {
            ConsumableTemplate consumableTemplate = filteredConsumableTemplates[index];
            if (consumableTemplate != null) {
                string path = AssetDatabase.GetAssetPath(consumableTemplate);
                AssetDatabase.DeleteAsset(path);

                // Set selectedConsumableTemplate to the deleted template (if it's the currently selected one)
                if (selectedConsumableTemplate == consumableTemplate) {
                    selectedConsumableTemplate = null;
                }

                filteredConsumableTemplates.RemoveAt(index);

                Debug.Log("ConsumableTemplate deleted.");
            }
        }
    }

    private void CreateNewConsumableTemplate(string newTemplateName, int potency) {
        int templateCount = 1;

        // Find a unique name for the new ConsumableTemplate
        while (filteredConsumableTemplates.Exists(t => t.name == newTemplateName)) {
            newTemplateName = $"New Consumable {templateCount}";
            templateCount++;
        }

        // Create a new ConsumableTemplate object with the default name
        selectedConsumableTemplate = CreateInstance<ConsumableTemplate>();
        selectedConsumableTemplate.name = newTemplateName;
        selectedConsumableTemplate.potency = potency;

        if (selectedConsumableTemplate != null) {
            // Create the new ConsumableTemplate asset with the specified name
            AssetDatabase.CreateAsset(selectedConsumableTemplate, $"Assets/Resources/GameComponents/Items/Consumables/{selectedConsumableTemplate.name}.asset");
            AssetDatabase.SaveAssets();

            Debug.Log("ConsumableTemplate created and saved!");
        }

        Debug.Log("New ConsumableTemplate created.");
    }

    private void SaveConsumableTemplate() {
        if (selectedConsumableTemplate != null) {
            // Get the path of the existing asset
            string path = AssetDatabase.GetAssetPath(selectedConsumableTemplate);

            // If the name has changed, update the asset's file name
            if (selectedConsumableTemplate.name != System.IO.Path.GetFileNameWithoutExtension(path)) {
                string directory = System.IO.Path.GetDirectoryName(path);
                string newFileName = $"{selectedConsumableTemplate.name}.asset";
                string newPath = System.IO.Path.Combine(directory, newFileName);
                AssetDatabase.RenameAsset(path, newFileName);

                // Refresh the asset database to apply the changes
                AssetDatabase.Refresh();
            }

            EditorUtility.SetDirty(selectedConsumableTemplate);
            AssetDatabase.SaveAssets();

            Debug.Log("ConsumableTemplate updated and saved!");
        }
    }

    private void DrawResourceTemplateFields() {
        EditorGUILayout.LabelField("Resource Template:");

        // Search and filter the ResourceTemplates based on the search query
        UpdateFilteredResourceTemplates();

        for (int i = 0; i < filteredResourceTemplates.Count; i++) {
            DrawResourceTemplate(filteredResourceTemplates[i], i);
            EditorGUILayout.Space();
        }

        if (selectedItemSubType == GameModuleCreator.ItemSubType.Resources) {
            DrawCreateButtonResource();
        }
    }

    private void UpdateFilteredResourceTemplates() {
        filteredResourceTemplates.Clear();
        ResourceTemplate[] allResourceTemplates = Resources.LoadAll<ResourceTemplate>("GameComponents/Items/Resources");

        foreach (ResourceTemplate resourceTemplate in allResourceTemplates) {
            if (string.IsNullOrEmpty(searchQuery) || resourceTemplate.resourceName.Contains(searchQuery)) {
                filteredResourceTemplates.Add(resourceTemplate);
            }
        }
    }

    private void DrawResourceTemplate(ResourceTemplate resourceTemplate, int index) {
        EditorGUILayout.BeginHorizontal();

        GUIStyle style = new GUIStyle(GUI.skin.button);
        if (resourceTemplate == selectedResourceTemplate) {
            style.normal.textColor = Color.yellow;
        }

        if (GUILayout.Button(resourceTemplate.resourceName, style)) {
            selectedResourceTemplate = resourceTemplate;
        }

        if (GUILayout.Button("Edit")) {
            Selection.activeObject = resourceTemplate;
        }

        if (GUILayout.Button("Delete")) {
            DeleteResourceTemplate(index);
        }

        EditorGUILayout.EndHorizontal();

        if (resourceTemplate == selectedResourceTemplate) {
            EditorGUI.BeginChangeCheck();
            string newResourceName = EditorGUILayout.TextField("Resource Name", resourceTemplate.resourceName);
            int pickStrengthReq = EditorGUILayout.IntField("Pickaxe Strength Required", resourceTemplate.pickStrengthRequired);
            int axeStrengthReq = EditorGUILayout.IntField("Axe Strength Required", resourceTemplate.axeStrengthRequired);

            // Add other fields for ResourceTemplate as needed

            if (EditorGUI.EndChangeCheck()) {
                // Check if changes were made
                if (newResourceName != resourceTemplate.resourceName || pickStrengthReq != resourceTemplate.pickStrengthRequired || axeStrengthReq != resourceTemplate.axeStrengthRequired) {
                    resourceTemplate.resourceName = newResourceName;
                    resourceTemplate.pickStrengthRequired = pickStrengthReq;
                    resourceTemplate.axeStrengthRequired = axeStrengthReq;

                }
            }
        }
    }

    private string newResourceName = "New Resource";
    private int pickStrengthRequired = 0;
    private int axeStrengthRequired = 0;
    private bool showCreateFieldsResource = false;

    private void DrawCreateButtonResource() {
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        if (!showCreateFieldsResource) {
            if (GUILayout.Button("Create")) {
                showCreateFieldsResource = true;
            }
        } else {
            newResourceName = EditorGUILayout.TextField("Resource Name", newResourceName);
            pickStrengthRequired = EditorGUILayout.IntField("Pickaxe Strength Required", pickStrengthRequired);
            axeStrengthRequired = EditorGUILayout.IntField("Axe Strength Required", axeStrengthRequired);

            // Add other fields for ResourceTemplate as needed

            EditorGUILayout.BeginVertical();

            if (GUILayout.Button("Save")) {
                CreateNewResourceTemplate(newResourceName, pickStrengthRequired, axeStrengthRequired);
                SaveResourceTemplate();
                showCreateFieldsResource = false;
            }

            if (GUILayout.Button("Cancel")) {
                showCreateFieldsResource = false;
            }

            EditorGUILayout.EndVertical();
        }

        GUI.enabled = selectedResourceTemplate != null;
        GUI.enabled = true;

        EditorGUILayout.EndHorizontal();
    }

    private void DeleteResourceTemplate(int index) {
        if (index >= 0 && index < filteredResourceTemplates.Count) {
            ResourceTemplate resourceTemplate = filteredResourceTemplates[index];
            if (resourceTemplate != null) {
                string path = AssetDatabase.GetAssetPath(resourceTemplate);
                AssetDatabase.DeleteAsset(path);

                // Set selectedResourceTemplate to the deleted template (if it's the currently selected one)
                if (selectedResourceTemplate == resourceTemplate) {
                    selectedResourceTemplate = null;
                }

                filteredResourceTemplates.RemoveAt(index);

                Debug.Log("ResourceTemplate deleted.");
            }
        }
    }

    private void CreateNewResourceTemplate(string newResourceName, int pickStrengthRequired, int axeStrengthRequired) {
        int templateCount = 1;

        // Find a unique name for the new ResourceTemplate
        while (filteredResourceTemplates.Exists(t => t.resourceName == newResourceName)) {
            newResourceName = $"New Resource {templateCount}";
            templateCount++;
        }

        // Create a new ResourceTemplate object with the default name
        selectedResourceTemplate = CreateInstance<ResourceTemplate>();
        selectedResourceTemplate.resourceName = newResourceName;
        selectedResourceTemplate.pickStrengthRequired = pickStrengthRequired;
        selectedResourceTemplate.axeStrengthRequired = axeStrengthRequired;

        if (selectedResourceTemplate != null) {
            // Create the new ResourceTemplate asset with the specified name
            AssetDatabase.CreateAsset(selectedResourceTemplate, $"Assets/Resources/GameComponents/Items/Resources/{selectedResourceTemplate.resourceName}.asset");
            AssetDatabase.SaveAssets();

            Debug.Log("ResourceTemplate created and saved!");
        }

        Debug.Log("New ResourceTemplate created.");
    }

    private void SaveResourceTemplate() {
        if (selectedResourceTemplate != null) {
            // Get the path of the existing asset
            string path = AssetDatabase.GetAssetPath(selectedResourceTemplate);

            // If the name has changed, update the asset's file name
            if (selectedResourceTemplate.resourceName != System.IO.Path.GetFileNameWithoutExtension(path)) {
                string directory = System.IO.Path.GetDirectoryName(path);
                string newFileName = $"{selectedResourceTemplate.resourceName}.asset";
                string newPath = System.IO.Path.Combine(directory, newFileName);
                AssetDatabase.RenameAsset(path, newFileName);

                // Refresh the asset database to apply the changes
                AssetDatabase.Refresh();
            }

            EditorUtility.SetDirty(selectedResourceTemplate);
            AssetDatabase.SaveAssets();

            Debug.Log("ResourceTemplate updated and saved!");
        }
    }

    private void DrawRecipeTemplateFields() {
        EditorGUILayout.LabelField("Recipe Template:");

        // Search and filter the RecipeTemplates based on the search query
        UpdateFilteredRecipeTemplates();

        for (int i = 0; i < filteredRecipeTemplates.Count; i++) {
            DrawRecipeTemplate(filteredRecipeTemplates[i], i);
            EditorGUILayout.Space();
        }

        if (selectedModuleType == GameModuleCreator.ModuleType.Recipes) {
            DrawCreateButtonRecipe();
        }
    }

    private void UpdateFilteredRecipeTemplates() {
        filteredRecipeTemplates.Clear();
        RecipeTemplate[] allRecipeTemplates = Resources.LoadAll<RecipeTemplate>("GameComponents/Recipes");

        foreach (RecipeTemplate recipeTemplate in allRecipeTemplates) {
            if (string.IsNullOrEmpty(searchQuery) || recipeTemplate.name.Contains(searchQuery)) {
                filteredRecipeTemplates.Add(recipeTemplate);
            }
        }
    }

    private void DrawRecipeTemplate(RecipeTemplate recipeTemplate, int index) {
        EditorGUILayout.BeginHorizontal();

        GUIStyle style = new GUIStyle(GUI.skin.button);
        if (recipeTemplate == selectedRecipeTemplate) {
            style.normal.textColor = Color.yellow;
        }

        if (GUILayout.Button(recipeTemplate.name, style)) {
            selectedRecipeTemplate = recipeTemplate;
        }

        if (GUILayout.Button("Edit")) {
            Selection.activeObject = recipeTemplate;
        }

        if (GUILayout.Button("Delete")) {
            DeleteRecipeTemplate(index);
        }

        EditorGUILayout.EndHorizontal();

        if (recipeTemplate == selectedRecipeTemplate) {
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.LabelField("Ingredients:");

            for (int i = 0; i < recipeTemplate.ingredients.Length; i++) {
                recipeTemplate.ingredients[i] = (BaseItemTemplate)EditorGUILayout.ObjectField($"Slot {i + 1}", recipeTemplate.ingredients[i], typeof(BaseItemTemplate), false);
            }

            if (EditorGUI.EndChangeCheck()) {
                SaveRecipeTemplate();
            }
        }
    }

    private string newRecipeName = "New Recipe";
    private bool showCreateFieldsRecipe = false;
    private List<BaseItemTemplate> newRecipeIngredients = new List<BaseItemTemplate>();
    private BaseItemTemplate newRecipeOutput;

    private void DrawCreateButtonRecipe() {
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        if (!showCreateFieldsRecipe) {
            if (GUILayout.Button("Create")) {
                showCreateFieldsRecipe = true;
                newRecipeIngredients.Clear();
                newRecipeOutput = null; // Initialize the output field when creating a new recipe
            }
        } else {
            newRecipeName = EditorGUILayout.TextField("Name", newRecipeName);

            // Add other fields for RecipeTemplate as needed

            EditorGUILayout.BeginVertical();

            EditorGUILayout.LabelField("Ingredients:");

            for (int i = 0; i < newRecipeIngredients.Count; i++) {
                newRecipeIngredients[i] = (BaseItemTemplate)EditorGUILayout.ObjectField($"Ingredient {i + 1}", newRecipeIngredients[i], typeof(BaseItemTemplate), false);
            }

            EditorGUILayout.BeginHorizontal();

            if (GUILayout.Button("Add Ingredient")) {
                newRecipeIngredients.Add(null);
            }

            if (GUILayout.Button("Remove Ingredient") && newRecipeIngredients.Count > 0) {
                newRecipeIngredients.RemoveAt(newRecipeIngredients.Count - 1);
            }

            EditorGUILayout.EndHorizontal();

            newRecipeOutput = (BaseItemTemplate)EditorGUILayout.ObjectField("Output", newRecipeOutput, typeof(BaseItemTemplate), false); // Output field

            if (GUILayout.Button("Save")) {
                CreateNewRecipeTemplate(newRecipeName, newRecipeIngredients.ToArray(), newRecipeOutput);
                SaveRecipeTemplate();
                showCreateFieldsRecipe = false;
            }

            if (GUILayout.Button("Cancel")) {
                showCreateFieldsRecipe = false;
            }

            EditorGUILayout.EndVertical();
        }

        GUI.enabled = selectedRecipeTemplate != null;
        GUI.enabled = true;

        EditorGUILayout.EndHorizontal();
    }

    private void DeleteRecipeTemplate(int index) {
        if (index >= 0 && index < filteredRecipeTemplates.Count) {
            RecipeTemplate recipeTemplate = filteredRecipeTemplates[index];
            if (recipeTemplate != null) {
                string path = AssetDatabase.GetAssetPath(recipeTemplate);
                AssetDatabase.DeleteAsset(path);

                // Set selectedRecipeTemplate to the deleted template (if it's the currently selected one)
                if (selectedRecipeTemplate == recipeTemplate) {
                    selectedRecipeTemplate = null;
                }

                filteredRecipeTemplates.RemoveAt(index);

                Debug.Log("RecipeTemplate deleted.");
            }
        }
    }

    private void CreateNewRecipeTemplate(string newRecipeName, BaseItemTemplate[] ingredients, BaseItemTemplate output) {
        int templateCount = 1;

        // Find a unique name for the new RecipeTemplate
        while (filteredRecipeTemplates.Exists(t => t.name == newRecipeName)) {
            newRecipeName = $"New Recipe {templateCount}";
            templateCount++;
        }

        // Create a new RecipeTemplate object with the default name
        selectedRecipeTemplate = CreateInstance<RecipeTemplate>();
        selectedRecipeTemplate.Initialize(newRecipeName, ingredients, output);

        if (selectedRecipeTemplate != null) {
            // Create the new RecipeTemplate asset with the specified name
            AssetDatabase.CreateAsset(selectedRecipeTemplate, $"Assets/Resources/GameComponents/Recipes/{selectedRecipeTemplate.name}.asset");
            AssetDatabase.SaveAssets();

            // Add the recipe to the CraftingBrain
            List<BaseItemTemplate> ingredientList = new List<BaseItemTemplate>(ingredients);
            CraftingBrain.AddRecipe(ingredientList, output);

            Debug.Log("RecipeTemplate created and saved!");
        }

        Debug.Log("New RecipeTemplate created.");
    }



    private void SaveRecipeTemplate() {
        if (selectedRecipeTemplate != null) {
            // Get the path of the existing asset
            string path = AssetDatabase.GetAssetPath(selectedRecipeTemplate);

            // If the name has changed, update the asset's file name
            if (selectedRecipeTemplate.name != System.IO.Path.GetFileNameWithoutExtension(path)) {
                string directory = System.IO.Path.GetDirectoryName(path);
                string newFileName = $"{selectedRecipeTemplate.name}.asset";
                string newPath = System.IO.Path.Combine(directory, newFileName);
                AssetDatabase.RenameAsset(path, newFileName);

                // Refresh the asset database to apply the changes
                AssetDatabase.Refresh();
            }

            EditorUtility.SetDirty(selectedRecipeTemplate);
            AssetDatabase.SaveAssets();

            Debug.Log("RecipeTemplate updated and saved!");
        }
    }
}
*/