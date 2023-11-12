using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using TMPro;

public class RangeTargetManager : MonoBehaviour, IDamageable
{
    public static event Action 
        ResetTargets,
        CountScore;

    public TextMeshProUGUI boardText;
    int score;

    private void OnEnable()
    {
        RangeTarget.SendScore += CountTargetScore;
    }

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

    string FormatScoreString(int score, int targetsHit, int totalTargets)
    {
        return $"Score: {score}, Targets Hit: {targetsHit}, Total Targets: {totalTargets}";
    }

    public void CountTargetScore()
    {
        score++;
        boardText.SetText("Work in Progress----------" + "\n" +FormatScoreString(score, 18,20));
    }

}
