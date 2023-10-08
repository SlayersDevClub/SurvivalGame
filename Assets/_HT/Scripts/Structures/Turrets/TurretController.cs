using UnityEngine;
using System.Collections.Generic;
using System.Linq;

namespace Gamekit3D {
    public class TurretController : MonoBehaviour {
        public float turretRange;
        public int turretDamage;
        public float fireDelay;
        public GameObject horizontalRotationObject; // Assign in the Inspector
        public GameObject verticalRotationObject;   // Assign in the Inspector

        private Queue<Transform> enemyQueue = new Queue<Transform>(); // Queue to store enemies in the trigger

        private void Start() {

            SphereCollider turretAwarenessZone = transform.GetComponent<SphereCollider>();
            turretAwarenessZone.radius = turretRange;
        }

        private void OnTriggerEnter(Collider other) {
            if (other.CompareTag("Enemy")) {
                Transform enemyTransform = other.transform;

                // If the queue is empty, set the target to the first enemy
                if (enemyQueue.Count == 0) {
                    SetTarget(enemyTransform);
                }

                enemyQueue.Enqueue(enemyTransform);
            }
        }

        private void OnTriggerExit(Collider other) {
            if (other.CompareTag("Enemy")) {
                Transform exitedEnemy = other.transform;
                if (exitedEnemy == enemyQueue.Peek()) {
                    // The first enemy in the queue exited, set the next one as the target if available
                    enemyQueue.Dequeue();
                    if (enemyQueue.Count > 0) {
                        SetTarget(enemyQueue.Peek());
                    } else {
                        // If the queue is empty, clear the target
                        ClearTarget();
                    }
                } else {
                    // If other enemies in the queue exit, remove them from the queue
                    RemoveFromQueue(exitedEnemy);
                }
            }
        }

        private void Update() {
            if (enemyQueue.Count > 0) {
                Transform currentTarget = enemyQueue.Peek();

                // Check if the current target exists in the queue
                if (currentTarget != null) {
                    // Calculate the direction to the current target
                    Vector3 directionToEnemy = currentTarget.position - transform.position;

                    // Remove any Y-axis rotation
                    directionToEnemy.y = 0;

                    // Rotate the horizontalRotationObject to face the current target on the Y-axis
                    horizontalRotationObject.transform.rotation = Quaternion.LookRotation(directionToEnemy);

                    // Rotate the verticalRotationObject to face the current target on the X-axis
                    Vector3 directionToEnemyWithoutVerticalRotation = currentTarget.position - verticalRotationObject.transform.position + new Vector3(0f, currentTarget.transform.GetComponent<CapsuleCollider>().center.y, 0f);
                    verticalRotationObject.transform.rotation = Quaternion.LookRotation(directionToEnemyWithoutVerticalRotation);

                    // Start invoking FireTurret with a delay and repeat every fireDelay seconds
                    if (!IsInvoking("FireTurret")) {
                        InvokeRepeating("FireTurret", 0f, fireDelay);
                    }
                } else {
                    // The current target is null, remove it from the queue
                    enemyQueue.Dequeue();
                }
            } else {
                // Stop invoking FireTurret when there are no enemies in range
                CancelInvoke("FireTurret");
            }
        }



        private void FireTurret() {
            RaycastHit hit;
            Vector3 raycastOrigin = verticalRotationObject.transform.position;
            Vector3 raycastDirection = verticalRotationObject.transform.forward;

            // Draw a debug ray to visualize the raycast
            Debug.DrawRay(raycastOrigin, raycastDirection * turretRange, Color.red, 1f); // Adjust the color and duration as needed

            if (Physics.Raycast(raycastOrigin, raycastDirection, out hit, turretRange * 2)) {
                Damageable d = hit.transform.gameObject.GetComponent<Damageable>();
                if (d != null) {
                    Damageable.DamageMessage thisDamage = new Damageable.DamageMessage();
                    thisDamage.amount = turretDamage;
                    d.ApplyDamage(thisDamage);
                }
            }
        }


        private void SetTarget(Transform targetTransform) {
            // Set the current target (enemy) to the provided targetTransform
            ClearTarget();
            target = targetTransform;
        }

        private void ClearTarget() {
            // Clear the current target (enemy)
            target = null;
        }

        private void RemoveFromQueue(Transform targetTransform) {
            // Create a new queue excluding the specified targetTransform
            Queue<Transform> newQueue = new Queue<Transform>();
            foreach (Transform enemyTransform in enemyQueue) {
                if (enemyTransform != targetTransform) {
                    newQueue.Enqueue(enemyTransform);
                }
            }
            enemyQueue = newQueue;
        }

        private Transform target; // To store the current target (enemy)
    }
}