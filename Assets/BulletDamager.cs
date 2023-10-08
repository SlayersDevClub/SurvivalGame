using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Gamekit3D {

    public class BulletDamager : MonoBehaviour {

        void Update() {
            RaycastHit hit;

            if (Physics.Raycast(transform.position, transform.forward, out hit, 5f)) {
                Damageable hitByBullet = hit.transform.gameObject.GetComponent<Damageable>();
                if (hitByBullet != null) {
                    Damageable.DamageMessage damageToApply = new Damageable.DamageMessage();
                    damageToApply.amount = 1;
                    hitByBullet.ApplyDamage(damageToApply);
                }
            }
        }
    }
}

