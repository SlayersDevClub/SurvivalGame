using UnityEngine;
using Gamekit3D;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;

public class Effectable : MonoBehaviour, IEffectable {

    public List<IEffectable.EffectTypes> typesAllowed;

    public UnityEvent OnApplyDamage, OnApplyHealing, OnApplyHunger, OnApplySpeed, OnRemoveAll;

    private Damageable damageable;


    private void Start() {
        damageable = GetComponent<Damageable>() ?? null;

        if (damageable == null) {
            typesAllowed.Remove(IEffectable.EffectTypes.DAMAGE);
            typesAllowed.Remove(IEffectable.EffectTypes.HEALING);
        }
    }

    public void ApplyEffect(StatusEffectTemplate statusEffect) {
        foreach (IEffectable.EffectTypes effect in statusEffect.effectTypes) {
            if (!typesAllowed.Contains(effect)) {
                Debug.Log("Effect type '" + effect.ToString() + "' not allowed on '" + transform.name + "'.");
                continue;
            }

            switch (effect) {
                case IEffectable.EffectTypes.DAMAGE:
                    ApplyDamage(statusEffect.damageFlat, statusEffect.damageOverTime, statusEffect.duration, statusEffect.tickSpeed);
                    break;
                case IEffectable.EffectTypes.HEALING:
                    ApplyHealing(statusEffect.healthFlat, statusEffect.healthOverTime, statusEffect.duration, statusEffect.tickSpeed);
                    break;
                case IEffectable.EffectTypes.HUNGER:
                    break;
                case IEffectable.EffectTypes.SPEED:
                    break;
            }
        }
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

    private void ApplyDamage(int damageFlat, int damageOverTime, int duration, int tickSpeed) {
        if (damageFlat != 0) {
            Damageable.DamageMessage message = new Damageable.DamageMessage {
                amount = damageFlat
            };

            damageable.ApplyDamage(message);
        }

        if (damageOverTime != 0 && duration != 0 && tickSpeed != 0) {
            StartCoroutine(DOT(damageOverTime, duration, tickSpeed));
        }
    }

    IEnumerator DOT(int damageOverTime, int duration, int tickSpeed) {
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

    private void ApplyHealing(int healthFlat, int healthOverTime, int duration, int tickSpeed) {
        if (healthFlat != 0) {
            damageable.ApplyHealing(healthFlat);
        }

        if (healthOverTime != 0 && duration != 0 && tickSpeed != 0) {
            StartCoroutine(HOT(healthOverTime, duration, tickSpeed));
        }
    }

    IEnumerator HOT(int healthOverTime, int duration, int tickSpeed) {
        float startTime = Time.time;

        while (Time.time - startTime < duration) {
            damageable.ApplyHealing(healthOverTime);

            yield return new WaitForSeconds(tickSpeed);
        }
    }
}
