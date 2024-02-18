using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewGunTemplate", menuName = "Game/Gun Template")]
public class GunTemplate : CustomItemTemplate {
    public float shootForce, upwardForce;
    public float timeBetweenShooting, spread, reloadTime, timeBetweenShots;
    public int magazineSize, bulletsPerTap, damage;
    public float recoilForce;
    public bool allowButtonHold;
    public BaseItemTemplate[] partPrefabPaths;

    public void Init(float _shootForce, float _upwardForce, float _timeBetweenShooting, float _spread, float _reloadTime, float _timeBetweenShots, int _magazineSize, int _bulletsPerTap, float _recoilForce, int _damage, bool _allowButtonHold) {
        // Assign the provided values to the corresponding variables
        shootForce = _shootForce;
        upwardForce = _upwardForce;
        timeBetweenShooting = _timeBetweenShooting;
        spread = _spread;
        reloadTime = _reloadTime;
        timeBetweenShots = _timeBetweenShots;
        magazineSize = _magazineSize;
        bulletsPerTap = _bulletsPerTap;
        recoilForce = _recoilForce;
        damage = _damage;
        allowButtonHold = _allowButtonHold;
    }

}
