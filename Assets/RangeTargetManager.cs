using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class RangeTargetManager : MonoBehaviour, IDamageable
{
    public static event Action ResetTargets;

    public void ResetAllTargets()
    {
        ResetTargets?.Invoke();
    }
    public Vector3 Position
    {
        get
        {
            return transform.position;
        }
    }
    public void Damage(float n)
    {
        ResetAllTargets();
    }

}
