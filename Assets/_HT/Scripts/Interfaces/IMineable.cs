using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IMineable {

    public abstract void TakeDamage(int damage, int pickaxeStrength, int axeStrength);

    public abstract void OnDestroy();

}
