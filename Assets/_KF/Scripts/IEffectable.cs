
public interface IEffectable {

    enum EffectTypes {
        DAMAGE,
        HEALING,
        HUNGER,
        SPEED
    }

    public void ApplyEffect(StatusEffectTemplate statusEffect);
    public void RemoveEffect(StatusEffectTemplate statusEffect);
    public void RemoveAllEffects();

}
