using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewToolTemplate", menuName = "Game/Tool Template")]
public class ToolTemplate : CustomItemTemplate {
    public int pickaxeStrength;
    public int axeStrength;
    public int speed;
    public float swingSpeed;
    public int damage;
    public BaseItemTemplate[] partPrefabPaths;
}
