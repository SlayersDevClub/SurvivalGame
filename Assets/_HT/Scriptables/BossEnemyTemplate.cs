using UnityEngine;

[CreateAssetMenu(fileName = "NewEnemyTemplate", menuName = "Game/Enemy Template")]
public class BossEnemyTemplate : ScriptableObject {
    public string name;
    public int health;
    public bool IsNew = true; // Add a boolean flag to identify if the template is new
}
