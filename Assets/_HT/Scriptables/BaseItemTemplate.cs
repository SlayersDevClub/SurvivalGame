using UnityEngine;

[System.Serializable]
public class BaseItemTemplate : ScriptableObject {
    public string Id;
    public string itemName;
    public string description;
    public bool stackable;
    public GameObject prefab;
    public Sprite icon;

    private void OnEnable() {
        if (string.IsNullOrEmpty(Id)) {
            Id = ScriptableObjectIdUtility.GenerateUnique4DigitNumber().ToString();
        }
    }
}
