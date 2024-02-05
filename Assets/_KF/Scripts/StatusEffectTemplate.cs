using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewStatusEffectTemplate", menuName = "Game/StatusEffect Template")]

public class StatusEffectTemplate : ScriptableObject {
    public List<IEffectable.EffectTypes> effectTypes = new List<IEffectable.EffectTypes>();

    public int healthFlat;
    public int healthOverTime;

    public int damageFlat;
    public int damageOverTime;

    public int duration;
    public int tickSpeed;

    public ParticleSystem particleEffect;
}
