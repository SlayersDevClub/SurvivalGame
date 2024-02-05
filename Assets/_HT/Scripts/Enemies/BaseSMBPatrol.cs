using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Animations;
using UnityEngine.AI;

namespace Gamekit3D {
    public class BaseSMBPatrol : SceneLinkedSMB<BaseEnemy> {
        public int numberOfPatrolPoints = 5; // Adjust as needed
        public float radiusAroundEnemy = 5f; // Adjust as needed
        public float minimumIdleGruntTime = 2.0f;
        public float maximumIdleGruntTime = 5.0f;

        protected float remainingToNextGrunt = 0.0f;
        protected int currentPatrolIndex = 0;
        protected Transform[] patrolPoints;

        public override void OnStart(Animator animator) {
            base.OnStart(animator);
                
            if (minimumIdleGruntTime > maximumIdleGruntTime)
                minimumIdleGruntTime = maximumIdleGruntTime;

            remainingToNextGrunt = Random.Range(minimumIdleGruntTime, maximumIdleGruntTime);

            // Generate patrol points by sampling positions on the nav mesh
            GeneratePatrolPoints();
        }

        void GeneratePatrolPoints() {
            if (numberOfPatrolPoints <= 0) {
                Debug.LogError("PatrolAI: numberOfPatrolPoints should be greater than 0");
                return;
            }

            patrolPoints = new Transform[numberOfPatrolPoints];

            for (int i = 0; i < numberOfPatrolPoints; i++) {
                Vector3 randomDirection = Random.insideUnitSphere * radiusAroundEnemy;
                randomDirection += m_MonoBehaviour.transform.position;

                NavMeshHit hit;
                if (NavMesh.SamplePosition(randomDirection, out hit, radiusAroundEnemy, NavMesh.AllAreas)) {
                    // Create an empty GameObject for each patrol point
                    GameObject patrolPointObject = new GameObject("PatrolPoint" + i);
                    patrolPointObject.transform.position = hit.position;
                    patrolPoints[i] = patrolPointObject.transform;
                } else {
                    Debug.LogWarning("PatrolAI: Unable to find a valid patrol point position.");
                }
            }
        }

        public override void OnSLStateNoTransitionUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex) {
            base.OnSLStateNoTransitionUpdate(animator, stateInfo, layerIndex);

            remainingToNextGrunt -= Time.deltaTime;

            if (remainingToNextGrunt < 0) {
                remainingToNextGrunt = Random.Range(minimumIdleGruntTime, maximumIdleGruntTime);
                m_MonoBehaviour.Grunt();
            }

            if (patrolPoints.Length > 0) {
                Patrol();
            }

            m_MonoBehaviour.FindTarget();
            if (m_MonoBehaviour.target != null) {
                m_MonoBehaviour.StartPursuit();
            }
        }

        void Patrol() {
            // Move towards the current patrol point
            Vector3 targetPosition = patrolPoints[currentPatrolIndex].position;
            m_MonoBehaviour.controller.SetTarget(targetPosition);


            // Check if the enemy has reached the patrol point
            float distance = Vector3.Distance(m_MonoBehaviour.transform.position, targetPosition);
            if (distance < 0.1f) {
                // Move to the next patrol point
                currentPatrolIndex = (currentPatrolIndex + 1) % patrolPoints.Length;
                m_MonoBehaviour.controller.SetForward(patrolPoints[currentPatrolIndex].position - m_MonoBehaviour.transform.position);

            }
        }
    }
}
