using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetDamage : MonoBehaviour, IDamageable
{
    public int score;
    public Vector3 Position
    {
        get
        {
            return transform.position;
        }
    }
    public void Damage(float n)
    {
        transform.root.GetComponent<RangeTarget>().RegisterDamage(score);
    }
}
