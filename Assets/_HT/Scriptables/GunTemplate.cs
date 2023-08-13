using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewGunTemplate", menuName = "Game/Gun Template")]
public class GunTemplate : BaseItemTemplate {
    public int ammoCapacity;
    public float fireRate;
    public float reloadTime;
}
