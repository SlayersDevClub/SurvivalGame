using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Pickaxe Scriptable Object Classes
[CreateAssetMenu(fileName = "NewPickaxeHandleTemplate", menuName = "Game/Pickaxe Handle Template")]
public class PickaxeHandleTemplate : BaseItemTemplate {
    public float swingSpeed;
    public int pickaxeStrength;
    public int axeStrength;
    public int damage;
}
