using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewMineableTemplate", menuName = "Game/Mineable Template")]
public class MineableTemplate : ScriptableObject {
    public GameObject prefab;
    public int health;
    public int requiredPickaxeStrength;
    public int requiredAxeStrength;
    public Color32 hitColor;

    [SerializeField]
    public List<Drop> dropables;
}

[System.Serializable]
public class Drop {
    public GameObject drop;
    public int dropNum;
    public float dropRate;
}
