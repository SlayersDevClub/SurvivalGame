using UnityEngine;

[CreateAssetMenu(fileName = "NewResourceTemplate", menuName = "GameComponents/Items/Resources/ResourceTemplate")]
public class ResourceTemplate : BaseItemTemplate {
    public string resourceName;
    public int pickStrengthRequired;
    public int axeStrengthRequired;
    // Add other fields for ResourceTemplate as needed
}
