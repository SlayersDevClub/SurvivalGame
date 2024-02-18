using UnityEngine;
using System;
using Newtonsoft.Json;
public class BaseItemTemplate : ScriptableObject {
    public string Id;
    public string itemName;
    public string description;
    public bool stackable;

    public string prefabString;
    public string slug;

    [JsonIgnore]
    public GameObject prefab;

    [JsonIgnore]
    public Sprite icon;

    private void OnEnable() {
        if (string.IsNullOrEmpty(Id)) {
            Id = ScriptableObjectIdUtility.GenerateUnique4DigitNumber().ToString();
        }
    }
}
