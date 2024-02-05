using UnityEngine;

[CreateAssetMenu(fileName = "NewConsumableTemplate", menuName = "Game/Consumable Template")]

public class ConsumableTemplate : BaseItemTemplate {
    public StatusEffectTemplate effect;
    public int consumeTime;
    public int cooldown;
}
