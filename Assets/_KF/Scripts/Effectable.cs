using UnityEngine;
using Gamekit3D;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;

public class Effectable : MonoBehaviour, IEffectable {

    public List<IEffectable.EffectTypes> typesAllowed;

    public UnityEvent OnApplyDamage, OnApplyHealing, OnApplyHunger, OnApplySpeed, OnRemoveAll;

    private Damageable damageable;
    private Hungry hungry;


    private void Start() {
        damageable = GetComponent<Damageable>() ?? null;
        hungry = GetComponent<Hungry>() ?? null;

        if (damageable == null) {
            typesAllowed.RemoveAll(effect => 
                effect == IEffectable.EffectTypes.DAMAGE_FLAT || 
                effect == IEffectable.EffectTypes.DOT ||
                effect == IEffectable.EffectTypes.HEALING_FLAT ||
                effect == IEffectable.EffectTypes.HOT);
        }

        if (hungry == null) {
            typesAllowed.Remove(IEffectable.EffectTypes.HUNGER);
        }
    }

    public bool ApplyEffect(StatusEffectTemplate statusEffect) {
        bool ret = false;

        foreach (IEffectable.EffectTypes effect in statusEffect.effectTypes) {
            if (!typesAllowed.Contains(effect)) {
                Debug.Log("Effect type '" + effect.ToString() + "' not allowed on '" + transform.name + "'.");
                continue;
            }

            switch (effect) {
                case IEffectable.EffectTypes.DAMAGE_FLAT:
                    if (statusEffect.damageFlat == 0)
                        Debug.Log("Value(s) for Effect type '" + effect.ToString() + "' are zero.");

                    ret |= ApplyDamageFlat(statusEffect.damageFlat);
                    break;
                case IEffectable.EffectTypes.DOT:
                    if (statusEffect.damageOverTime == 0 || statusEffect.duration == 0 || statusEffect.tickSpeed == 0)
                        Debug.Log("Value(s) for Effect type '" + effect.ToString() + "' are zero.");

                    StartCoroutine(ApplyDOT(statusEffect.damageOverTime, statusEffect.duration, statusEffect.tickSpeed));
                    ret = true;
                    break;
                case IEffectable.EffectTypes.HEALING_FLAT:
                    if (statusEffect.healthFlat == 0)
                        Debug.Log("Value(s) for Effect type '" + effect.ToString() + "' are zero.");

                    ret |= ApplyHealingFlat(statusEffect.healthFlat);
                    break;
                case IEffectable.EffectTypes.HOT:
                    StartCoroutine(ApplyHOT(statusEffect.healthOverTime, statusEffect.duration, statusEffect.tickSpeed));
                    ret = true;
                    break;
                case IEffectable.EffectTypes.HUNGER:
                    break;
                case IEffectable.EffectTypes.SPEED:
                    break;
            }
        }

        return ret;
    }

    public void RemoveAllEffects() {
        StopAllCoroutines();
    }

    public void RemoveEffect(StatusEffectTemplate statusEffect) {
        throw new System.NotImplementedException();
    }

    private void ApplyParticleEffect() {
        //TODO
    }
    
    ///// DAMAGE /////

    private bool ApplyDamageFlat(int damageFlat) {
        Damageable.DamageMessage message = new Damageable.DamageMessage {
            amount = damageFlat
        };

        return damageable.ApplyDamage(message);
    }

    IEnumerator ApplyDOT(int damageOverTime, int duration, int tickSpeed) {
        float startTime = Time.time;

        while (Time.time - startTime < duration) {
            Damageable.DamageMessage message = new Damageable.DamageMessage {
                amount = damageOverTime
            };

            damageable.ApplyDamage(message);

            yield return new WaitForSeconds(tickSpeed);
        }
    }

    ///// HEALING /////

    private bool ApplyHealingFlat(int healthFlat) {
        return damageable.ApplyHealing(healthFlat);
    }

    IEnumerator ApplyHOT(int healthOverTime, int duration, int tickSpeed) {
        float startTime = Time.time;

        while (Time.time - startTime < duration) {
            damageable.ApplyHealing(healthOverTime);

            yield return new WaitForSeconds(tickSpeed);
        }
    }

    ///// HUNGER /////
    
    private void ApplyRaiseHunger(int hunger) {
        //TODO
    }

    private void ApplyReduceHunger(int hunger) {
        //TODO
    }
}
