using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Linq;

public class ModuleSearchEditorWindow : EditorWindow {
    private enum Category {
        Item,
        Enemy,
        Recipes
    }

    private enum ItemSubCategory {
        Consumables,
        Resources,
        Equiptables
    }

    private enum EquiptableSubCategory {
        None,
        Weapons,
        Tools
    }

    private enum WeaponSubCategory {
        None,
        Guns,
        Swords
    }

    private enum GunSubCategory {
        None,
        Mag,
        Sight,
        Grip,
        Body,
        Barrel,
        Stock
    }

    private enum SwordSubCategory {
        None,
        Pummel,
        Crossguard,
        Grip,
        Blade,
        Enchantment
    }

    private enum ToolSubCategory {
        None,
        Axe,
        Pickaxe,
        Hammer
    }

    private enum AxeSubCategory {
        None,
        Handle,
        Blade
    }

    private enum PickaxeSubCategory {
        None,
        Handle,
        Pick
    }

    private enum HammerSubCategory {
        None,
        Handle,
        Head
    }

    private enum EnemySubCategory {
        Normal,
        Boss
    }

    private Category selectedCategory = Category.Item;
    private ItemSubCategory selectedItemSubCategory = ItemSubCategory.Consumables;
    private EquiptableSubCategory selectedEquiptableSubCategory = EquiptableSubCategory.None;
    private WeaponSubCategory selectedWeaponSubCategory = WeaponSubCategory.None;
    private GunSubCategory selectedGunSubCategory = GunSubCategory.None;
    private SwordSubCategory selectedSwordSubCategory = SwordSubCategory.None;
    private ToolSubCategory selectedToolSubCategory = ToolSubCategory.None;
    private AxeSubCategory selectedAxeSubCategory = AxeSubCategory.None;
    private PickaxeSubCategory selectedPickaxeSubCategory = PickaxeSubCategory.None;
    private HammerSubCategory selectedHammerSubCategory = HammerSubCategory.None;
    private EnemySubCategory selectedEnemySubCategory = EnemySubCategory.Normal; // Default to Normal
    private string newObjectName = "NewObject"; // Default name for the newly created object
    private string customObjectName = ""; // Custom name for the newly created object
    [MenuItem("Window/Module Search Editor")]
    public static void ShowWindow() {
        GetWindow<ModuleSearchEditorWindow>("Module Search");
    }

    private void OnGUI() {
        selectedCategory = (Category)EditorGUILayout.EnumPopup("Category", selectedCategory);

        switch (selectedCategory) {
            case Category.Item:
                selectedItemSubCategory = (ItemSubCategory)EditorGUILayout.EnumPopup("Item Sub Category", selectedItemSubCategory);
                break;
            case Category.Enemy:
                selectedEnemySubCategory = (EnemySubCategory)EditorGUILayout.EnumPopup("Enemy Sub Category", selectedEnemySubCategory);
                break;
            case Category.Recipes:
                // Show recipe related subcategories if needed
                break;
            default:
                break;
        }

        EditorGUILayout.LabelField("Selected Sub Category:", GetSelectedSubCategoryString());

        GUILayout.Space(10); // Add some spacing between the subcategories and the "Create" button

        if (GUILayout.Button("Create")) {
            // Handle the creation of the scriptable object based on the selected subcategory
            CreateScriptableObject();
        }

        customObjectName = EditorGUILayout.TextField("Custom Object Name", customObjectName);

        DisplayScriptableObjectFields();

        if (GUILayout.Button("Save")) {
            // Handle the renaming of the created scriptable object file
            RenameScriptableObject();
        }
    }

    private string GetSelectedSubCategoryString() {
        string result = string.Empty;

        switch (selectedCategory) {
            case Category.Item:
                switch (selectedItemSubCategory) {
                    case ItemSubCategory.Equiptables:
                        selectedEquiptableSubCategory = (EquiptableSubCategory)EditorGUILayout.EnumPopup("Equiptable Sub Category", selectedEquiptableSubCategory);
                        switch (selectedEquiptableSubCategory) {
                            case EquiptableSubCategory.Weapons:
                                selectedWeaponSubCategory = (WeaponSubCategory)EditorGUILayout.EnumPopup("Weapon Sub Category", selectedWeaponSubCategory);
                                switch (selectedWeaponSubCategory) {
                                    case WeaponSubCategory.Guns:
                                        selectedGunSubCategory = (GunSubCategory)EditorGUILayout.EnumPopup("Gun Sub Category", selectedGunSubCategory);
                                        switch (selectedGunSubCategory) {
                                            case GunSubCategory.Mag:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            case GunSubCategory.Sight:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            case GunSubCategory.Grip:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            case GunSubCategory.Body:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            case GunSubCategory.Barrel:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            case GunSubCategory.Stock:
                                                result = selectedGunSubCategory.ToString();
                                                break;
                                            default:
                                                break;
                                        }
                                        break;
                                    case WeaponSubCategory.Swords:
                                        selectedSwordSubCategory = (SwordSubCategory)EditorGUILayout.EnumPopup("Sword Sub Category", selectedSwordSubCategory);
                                        switch (selectedSwordSubCategory) {
                                            case SwordSubCategory.Pummel:
                                                result = selectedSwordSubCategory.ToString();
                                                break;
                                            case SwordSubCategory.Crossguard:
                                                result = selectedSwordSubCategory.ToString();
                                                break;
                                            case SwordSubCategory.Grip:
                                                result = selectedSwordSubCategory.ToString();
                                                break;
                                            case SwordSubCategory.Blade:
                                                result = selectedSwordSubCategory.ToString();
                                                break;
                                            case SwordSubCategory.Enchantment:
                                                result = selectedSwordSubCategory.ToString();
                                                break;
                                            default:
                                                break;
                                        }
                                        break;
                                    default:
                                        break;
                                }
                                break;
                            case EquiptableSubCategory.Tools:
                                selectedToolSubCategory = (ToolSubCategory)EditorGUILayout.EnumPopup("Tool Sub Category", selectedToolSubCategory);
                                switch (selectedToolSubCategory) {
                                    case ToolSubCategory.Axe:
                                        selectedAxeSubCategory = (AxeSubCategory)EditorGUILayout.EnumPopup("Axe Sub Category", selectedAxeSubCategory);
                                        switch (selectedAxeSubCategory) {
                                            case AxeSubCategory.Handle:
                                                result = selectedAxeSubCategory.ToString();
                                                break;
                                            case AxeSubCategory.Blade:
                                                result = selectedAxeSubCategory.ToString();
                                                break;
                                            default:
                                                break;
                                        }
                                        break;
                                    case ToolSubCategory.Pickaxe:
                                        selectedPickaxeSubCategory = (PickaxeSubCategory)EditorGUILayout.EnumPopup("Pickaxe Sub Category", selectedPickaxeSubCategory);
                                        switch (selectedPickaxeSubCategory) {
                                            case PickaxeSubCategory.Handle:
                                                result = selectedPickaxeSubCategory.ToString();
                                                break;
                                            case PickaxeSubCategory.Pick:
                                                result = selectedPickaxeSubCategory.ToString();
                                                break;
                                            default:
                                                break;
                                        }
                                        break;
                                    case ToolSubCategory.Hammer:
                                        selectedHammerSubCategory = (HammerSubCategory)EditorGUILayout.EnumPopup("Hammer Sub Category", selectedHammerSubCategory);
                                        switch (selectedHammerSubCategory) {
                                            case HammerSubCategory.Handle:
                                                result = selectedHammerSubCategory.ToString();
                                                break;
                                            case HammerSubCategory.Head:
                                                result = selectedHammerSubCategory.ToString();
                                                break;
                                            default:
                                                break;
                                        }
                                        break;
                                    default:
                                        break;
                                }
                                break;
                            default:
                                break;
                        }
                        break;
                    default:
                        break;
                }
                break;
            case Category.Enemy:
                result = selectedEnemySubCategory.ToString();
                break;
            case Category.Recipes:
                // Return recipe related subcategory string if needed
                break;
            default:
                break;
        }

        return result;
    }


    private void CreateScriptableObject() {
        switch (selectedCategory) {
            case Category.Item:
                CreateItemScriptableObject();
                break;
            case Category.Enemy:
                CreateEnemyScriptableObject();
                break;
            case Category.Recipes:
                CreateRecipeScriptableObject();
                break;
            default:
                break;
        }
    }

    private void CreateItemScriptableObject() {
        switch (selectedItemSubCategory) {
            case ItemSubCategory.Consumables:
                CreateScriptableObjectOfType<ConsumableTemplate>("Items/Consumables");
                break;
            case ItemSubCategory.Resources:
                CreateScriptableObjectOfType<ResourceTemplate>("Items/Resources");
                break;
            case ItemSubCategory.Equiptables:
                CreateEquiptableScriptableObject();
                break;
            default:
                break;
        }
    }

    private void CreateEquiptableScriptableObject() {
        switch (selectedEquiptableSubCategory) {
            case EquiptableSubCategory.Weapons:
                CreateWeaponScriptableObject();
                break;
            case EquiptableSubCategory.Tools:
                CreateToolScriptableObject();
                break;
            default:
                break;
        }
    }

    private void CreateWeaponScriptableObject() {
        switch (selectedWeaponSubCategory) {
            case WeaponSubCategory.Guns:
                CreateGunScriptableObject();
                break;
            case WeaponSubCategory.Swords:
                CreateSwordScriptableObject();
                break;
            default:
                break;
        }
    }

    private void CreateGunScriptableObject() {
        switch (selectedGunSubCategory) {
            case GunSubCategory.Mag:
                CreateScriptableObjectOfType<MagTemplate>("Items/Equiptables/Weapons/Guns/Mag");
                break;
            case GunSubCategory.Sight:
                CreateScriptableObjectOfType<SightTemplate>("Items/Equiptables/Weapons/Guns/Sight");
                break;
            case GunSubCategory.Grip:
                CreateScriptableObjectOfType<GripTemplate>("Items/Equiptables/Weapons/Guns/Grip");
                break;
            case GunSubCategory.Body:
                CreateScriptableObjectOfType<BodyTemplate>("Items/Equiptables/Weapons/Guns/Body");
                break;
            case GunSubCategory.Barrel:
                CreateScriptableObjectOfType<BarrelTemplate>("Items/Equiptables/Weapons/Guns/Barrel");
                break;
            case GunSubCategory.Stock:
                CreateScriptableObjectOfType<StockTemplate>("Items/Equiptables/Weapons/Guns/Stock");
                break;
            default:
                break;
        }
    }

    private void CreateSwordScriptableObject() {
        switch (selectedSwordSubCategory) {
            case SwordSubCategory.Pummel:
                CreateScriptableObjectOfType<PummelTemplate>("Items/Equiptables/Weapons/Swords/Pummel");
                break;
            case SwordSubCategory.Crossguard:
                CreateScriptableObjectOfType<CrossguardTemplate>("Items/Equiptables/Weapons/Swords/Crossguard");
                break;
            case SwordSubCategory.Grip:
                CreateScriptableObjectOfType<SwordGripTemplate>("Items/Equiptables/Weapons/Swords/Grip");
                break;
            case SwordSubCategory.Blade:
                CreateScriptableObjectOfType<BladeTemplate>("Items/Equiptables/Weapons/Swords/Blade");
                break;
            case SwordSubCategory.Enchantment:
                CreateScriptableObjectOfType<EnchantmentTemplate>("Items/Equiptables/Weapons/Swords/Enchantment");
                break;
            default:
                break;
        }
    }

    private void CreateToolScriptableObject() {
        switch (selectedToolSubCategory) {
            case ToolSubCategory.Axe:
                CreateAxeScriptableObject();
                break;
            case ToolSubCategory.Pickaxe:
                CreatePickaxeScriptableObject();
                break;
            case ToolSubCategory.Hammer:
                CreateHammerScriptableObject();
                break;
            default:
                break;
        }
    }

    private void CreateAxeScriptableObject() {
        switch (selectedAxeSubCategory) {
            case AxeSubCategory.Handle:
                CreateScriptableObjectOfType<AxeHandleTemplate>("Items/Equiptables/Tools/Axe/Handle");
                break;
            case AxeSubCategory.Blade:
                CreateScriptableObjectOfType<AxeBladeTemplate>("Items/Equiptables/Tools/Axe/Blade");
                break;
            default:
                break;
        }
    }

    private void CreateHammerScriptableObject() {
        switch (selectedHammerSubCategory) {
            case HammerSubCategory.Handle:
                CreateScriptableObjectOfType<HammerHandleTemplate>("Items/Equiptables/Tools/Hammer/Handle");
                break;
            case HammerSubCategory.Head:
                CreateScriptableObjectOfType<HammerHeadTemplate>("Items/Equiptables/Tools/Hammer/Head");
                break;
            default:
                break;
        }
    }

    private void CreatePickaxeScriptableObject() {
        switch (selectedPickaxeSubCategory) {
            case PickaxeSubCategory.Handle:
                CreateScriptableObjectOfType<PickaxeHandleTemplate>("Items/Equiptables/Tools/Pickaxe/Handle");
                break;
            case PickaxeSubCategory.Pick:
                CreateScriptableObjectOfType<PickaxePickTemplate>("Items/Equiptables/Tools/Pickaxe/Pick");
                break;
            default:
                break;
        }
    }

    private void CreateEnemyScriptableObject() {
        switch (selectedEnemySubCategory) {
            case EnemySubCategory.Normal:
                CreateScriptableObjectOfType<NormalEnemyTemplate>("Items/Enemies/Normal");
                break;
            case EnemySubCategory.Boss:
                CreateScriptableObjectOfType<BossEnemyTemplate>("Items/Enemies/Boss");
                break;
            default:
                break;
        }
    }

    private void CreateRecipeScriptableObject() {
        // Handle scriptable object creation for the Recipes category if needed
        // Add similar switch statements for each recipe subcategory
    }

    private void CreateScriptableObjectOfType<T>(string folderPath) where T : ScriptableObject {
        // Create the folder structure if it doesn't exist
        string fullFolderPath = "Assets/Resources/GameComponents/" + folderPath;
        if (!AssetDatabase.IsValidFolder(fullFolderPath)) {
            string[] folders = folderPath.Split('/');
            string parentFolder = "Assets/Resources/GameComponents";
            foreach (string folder in folders) {
                string newFolder = parentFolder + "/" + folder;
                if (!AssetDatabase.IsValidFolder(newFolder)) {
                    AssetDatabase.CreateFolder(parentFolder, folder);
                }
                parentFolder = newFolder;
            }
        }

        // Save the scriptable object to the appropriate folder
        string assetPath = fullFolderPath + "/" + (string.IsNullOrEmpty(customObjectName) ? newObjectName : customObjectName) + ".asset";
        T newObject = ScriptableObject.CreateInstance<T>();
        AssetDatabase.CreateAsset(newObject, assetPath);
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();

        // Set the newly created object as the active object in the Unity Editor
        Selection.activeObject = newObject;
    }

    private void DisplayScriptableObjectFields() {
        // Get the selected ScriptableObject
        ScriptableObject selectedObject = Selection.activeObject as ScriptableObject;

        if (selectedObject != null) {
            // Create a custom editor for the selected ScriptableObject
            Editor editor = Editor.CreateEditor(selectedObject);

            // Display the custom editor GUI
            if (editor != null) {
                editor.OnInspectorGUI();
            }
        }
    }

    private void RenameScriptableObject() {
        //LOADING
        List<BaseItemTemplate> loadListData = JsonDataManager.LoadData();

        // Get the selected ScriptableObject
        BaseItemTemplate selectedObject = Selection.activeObject as BaseItemTemplate;

        if (selectedObject != null) {
            // Add the selected object to the list
            loadListData.Add(selectedObject);

            // Serialize the list back to JSON and save it using JsonDataManager
            JsonDataManager.SaveData(loadListData);

            // Get the asset path of the selected ScriptableObject
            string assetPath = AssetDatabase.GetAssetPath(selectedObject);

            // Check if the custom object name is not empty
            if (!string.IsNullOrEmpty(customObjectName)) {
                // Remove any special characters from the custom object name
                string sanitizedObjectName = customObjectName.Replace(" ", "_").Replace(".", "").Replace("/", "");

                // Generate the new asset path with the custom object name
                string newAssetPath = assetPath.Replace(selectedObject.name, sanitizedObjectName);

                // Rename the asset file on disk
                AssetDatabase.RenameAsset(assetPath, sanitizedObjectName);

                // Move the asset file to the new path
                AssetDatabase.MoveAsset(assetPath, newAssetPath);

                // Refresh the AssetDatabase to see the changes
                AssetDatabase.Refresh();
            }
        }
    }



}
