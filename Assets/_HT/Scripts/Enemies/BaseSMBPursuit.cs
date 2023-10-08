using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace Gamekit3D {
    public class BaseSMBPursuit : SceneLinkedSMB<BaseEnemy> {
        private float nextActionTime = 0f;
        public float minActionInterval = 5f; // Minimum interval for actions (e.g., dodge or taunt)
        public float maxActionInterval = 10f; // Maximum interval for actions

        public override void OnSLStateNoTransitionUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex) {
            base.OnSLStateNoTransitionUpdate(animator, stateInfo, layerIndex);

            m_MonoBehaviour.FindTarget();

            if (m_MonoBehaviour.controller.navmeshAgent.pathStatus == NavMeshPathStatus.PathPartial
                || m_MonoBehaviour.controller.navmeshAgent.pathStatus == NavMeshPathStatus.PathInvalid) {
                m_MonoBehaviour.StopPursuit();
                return;
            }

            if (m_MonoBehaviour.target == null || m_MonoBehaviour.target.respawning) {
                m_MonoBehaviour.StopPursuit();
            } else {
                m_MonoBehaviour.RequestTargetPosition();

                Vector3 toTarget = m_MonoBehaviour.target.transform.position - m_MonoBehaviour.transform.position;

                if (toTarget.sqrMagnitude < m_MonoBehaviour.attackDistance * m_MonoBehaviour.attackDistance) {
                    m_MonoBehaviour.TriggerAttack();
                } else if (m_MonoBehaviour.followerData.assignedSlot != -1) {
                    Vector3 targetPoint = m_MonoBehaviour.target.transform.position +
                        m_MonoBehaviour.followerData.distributor.GetDirection(m_MonoBehaviour.followerData
                            .assignedSlot) * m_MonoBehaviour.attackDistance * 0.9f;

                    m_MonoBehaviour.controller.SetTarget(targetPoint);

                    // Check if it's time to perform a random action
                    if (Time.time >= nextActionTime) {
                        float randomAction = Random.Range(0f, 1f);

                        if (randomAction < 0.5f) {
                            // Call TriggerDodge() with a 50% chance
                            m_MonoBehaviour.TriggerDodge();
                        } else {
                            // Call TriggerTaunt() with a 50% chance
                            m_MonoBehaviour.TriggerTaunt();
                        }

                        // Calculate the next action time within the specified interval
                        nextActionTime = Time.time + Random.Range(minActionInterval, maxActionInterval);
                    }
                } else {
                    m_MonoBehaviour.StopPursuit();
                }
            }
        }
    }
}
