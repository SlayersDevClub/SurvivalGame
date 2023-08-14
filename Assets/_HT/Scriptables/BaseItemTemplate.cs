using UnityEngine;
using UnityEditor;
using System;
using System.Collections.Generic;

[Serializable]
public class BaseItemTemplate : ScriptableObject
{
    [ScriptableObjectId]
    public string Id;
    public string itemName;
    public string description;
    public bool stackable;
    public GameObject prefab;
    public Sprite icon;
}

public class ScriptableObjectIdAttribute : PropertyAttribute { }

[CustomPropertyDrawer(typeof(ScriptableObjectIdAttribute))]
public class ScriptableObjectIdDrawer : PropertyDrawer {
    private static HashSet<int> usedNumbers = new HashSet<int>();

    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label) {
        GUI.enabled = false;
        if (string.IsNullOrEmpty(property.stringValue)) {
            property.stringValue = GenerateUnique4DigitNumber().ToString();
        }
        EditorGUI.PropertyField(position, property, label, true);
        GUI.enabled = true;
    }

    private int GenerateUnique4DigitNumber() {
        int maxAttempts = 10000; // Limit the number of attempts to avoid infinite loop
        int attemptCount = 0;

        while (attemptCount < maxAttempts) {
            int randomNumber = UnityEngine.Random.Range(1000, 10000);
            if (!usedNumbers.Contains(randomNumber)) {
                usedNumbers.Add(randomNumber);
                return randomNumber;
            }
            attemptCount++;
        }

        Debug.LogError("Failed to generate a unique 4-digit number after " + maxAttempts + " attempts.");
        return 0; // Return 0 as a fallback value if unique number generation fails.
    }
}


