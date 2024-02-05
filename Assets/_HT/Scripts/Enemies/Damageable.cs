using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using Gamekit3D.Message;
using UnityEngine.Serialization;
using UnityEngine.UI;
using System;

namespace Gamekit3D {
    public partial class Damageable : MonoBehaviour {
        
        public int currentHitPoints { get; private set; }
        public int maxHitPoints;

        public bool isInvulnerable { get; set; }
        [Tooltip("Time that this gameObject is invulnerable for, after receiving damage.")]
        public float invulnerabiltyTime;

        public Slider healthBar;
        [Tooltip("Time it takes to hide health bar after enemy takes damage.")]

        private float healthBarTurnOffDelay = 5f;
        public bool healthBarTurnsOff;

        [Tooltip("The angle from which the damageable object is hitable. Always in the world XZ plane, with the forward being rotate by hitForwardRoation")]
        [Range(0.0f, 360.0f)]
        public float hitAngle = 360.0f;
        [Tooltip("Allow to rotate the world forward vector of the damageable used to define the hitAngle zone")]
        [Range(0.0f, 360.0f)]
        [FormerlySerializedAs("hitForwardRoation")] //SHAME!
        public float hitForwardRotation = 360.0f;

        public UnityEvent OnDeath, OnReceiveDamage, OnHitWhileInvulnerable, OnBecomeVulnerable, OnResetDamage, OnHeal;

        [Tooltip("When this gameObject is damaged, these other gameObjects are notified.")]
        [EnforceType(typeof(Message.IMessageReceiver))]
        public List<MonoBehaviour> onDamageMessageReceivers;

        protected float m_timeSinceLastHit = 0.0f;
        protected Collider m_Collider;

        System.Action schedule;

        void Start() {
            ResetDamage();
            m_Collider = GetComponent<Collider>();

            if (healthBar != null) {
                healthBar.maxValue = maxHitPoints;
                healthBar.value = maxHitPoints;

                //Turn off health bar to show only when damaged and then a bit after being damaged
                if (healthBarTurnsOff) {
                    healthBar.gameObject.SetActive(false);
                } else {
                    healthBar.gameObject.SetActive(true);
                }
            }
        }

        void Update() {
            if (isInvulnerable) {
                m_timeSinceLastHit += Time.deltaTime;
                if (m_timeSinceLastHit > invulnerabiltyTime) {
                    m_timeSinceLastHit = 0.0f;
                    isInvulnerable = false;
                    OnBecomeVulnerable.Invoke();
                }
            }
        }

        public void ResetDamage() {
            currentHitPoints = maxHitPoints;
            isInvulnerable = false;
            m_timeSinceLastHit = 0.0f;
            OnResetDamage.Invoke();
        }

        public void SetColliderState(bool enabled) {
            m_Collider.enabled = enabled;
        }

        public void ApplyDamage(DamageMessage data) {
            StopAllCoroutines();

            if (currentHitPoints <= 0) {
                // Ignore damage if already dead. TODO: may have to change that if we want to detect hit on death...
                return;
            }

            if (isInvulnerable) {
                OnHitWhileInvulnerable.Invoke();
                return;
            }

            Vector3 forward = transform.forward;
            forward = Quaternion.AngleAxis(hitForwardRotation, transform.up) * forward;

            // We project the direction to damager to the plane formed by the direction of damage
            Vector3 positionToDamager = data.damageSource - transform.position;
            positionToDamager -= transform.up * Vector3.Dot(transform.up, positionToDamager);

            if (Vector3.Angle(forward, positionToDamager) > hitAngle * 0.5f) {
                return;
            }

            isInvulnerable = true;
            currentHitPoints -= data.amount;
            if(healthBar != null) {
                healthBar.value = currentHitPoints;

                StartCoroutine(ShowHealthBar());
            }
         

            if (currentHitPoints <= 0) {
                schedule += OnDeath.Invoke; // This avoids race condition when objects kill each other.
           
            } else {
                OnReceiveDamage.Invoke();
            }

            var messageType = currentHitPoints <= 0 ? MessageType.DEAD : MessageType.DAMAGED;

            for (var i = 0; i < onDamageMessageReceivers.Count; ++i) {
                var receiver = onDamageMessageReceivers[i] as IMessageReceiver;
                receiver.OnReceiveMessage(messageType, this, data);
            }
        }

        public void ApplyHealing(int health_regain) {
            StopAllCoroutines();

            if (currentHitPoints == maxHitPoints) {
                Debug.Log("Health already at max.");
                return;
            }
            
            if (currentHitPoints + health_regain > maxHitPoints) {
                currentHitPoints = maxHitPoints;
            } else {
                currentHitPoints += health_regain;
            }

            if (healthBar != null) {
                healthBar.value = currentHitPoints;
                StartCoroutine(ShowHealthBar());
            }

        }

        private IEnumerator ShowHealthBar() {
            if (!healthBarTurnsOff) {
                yield break;
            }

            healthBar.gameObject.SetActive(true);
            yield return new WaitForSeconds(healthBarTurnOffDelay);
            healthBar.gameObject.SetActive(false);
        }


        void LateUpdate() {
            if (schedule != null) {
                schedule();
                schedule = null;
            }
        }

#if UNITY_EDITOR
        private void OnDrawGizmosSelected() {
            Vector3 forward = transform.forward;
            forward = Quaternion.AngleAxis(hitForwardRotation, transform.up) * forward;

            if (Event.current.type == EventType.Repaint) {
                UnityEditor.Handles.color = Color.blue;
                UnityEditor.Handles.ArrowHandleCap(0, transform.position, Quaternion.LookRotation(forward), 1.0f,
                    EventType.Repaint);
            }


            UnityEditor.Handles.color = new Color(1.0f, 0.0f, 0.0f, 0.5f);
            forward = Quaternion.AngleAxis(-hitAngle * 0.5f, transform.up) * forward;
            UnityEditor.Handles.DrawSolidArc(transform.position, transform.up, forward, hitAngle, 1.0f);
        }
#endif
    }

}