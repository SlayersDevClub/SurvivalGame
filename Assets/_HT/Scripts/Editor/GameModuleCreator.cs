using UnityEngine;

[System.Serializable]
public class GameModuleCreator : MonoBehaviour {
    public enum ModuleType {
        Item,
        Enemy,
        Recipes
    }

    public enum ItemSubType {
        Consumables,
        Resources
    }

    public enum EnemySubType {
        Boss,
        Normal
    }

    public ModuleType selectedModuleType;
    public ItemSubType selectedItemSubType;
    public EnemySubType selectedEnemySubType;
}
