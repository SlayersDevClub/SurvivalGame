
public interface IEffectable {

    enum EffectTypes {
        DAMAGE_FLAT,
        DOT,
        HEALING_FLAT,
        HOT,
        HUNGER,
        SPEED
    }

    public bool ApplyEffect(StatusEffectTemplate statusEffect);
    public void RemoveEffect(StatusEffectTemplate statusEffect);
    public void RemoveAllEffects();

}
