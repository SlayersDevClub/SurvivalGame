using DG.Tweening;
using UnityEngine;
using TMPro;

public class RangeTarget : MonoBehaviour
{
    public Transform flagPole, score1,score2,score3;
    public TextMeshProUGUI displayText;
    RangeTargetManager rtm;
    private void OnEnable()
    {
        RangeTargetManager.ResetTargets += ResetTarget;
    }

    private void OnDisable()
    {
        RangeTargetManager.ResetTargets -= ResetTarget;
    }
    private void Start()
    {
        flagPole.DOLocalRotate(new Vector3(0, 0, 90), 0.5f).SetEase(Ease.OutBack);
    }
    public void TriggerFlag()
    {
        flagPole.DOLocalRotate(Vector3.zero, 0.5f).SetEase(Ease.OutBack);

    }
    public void RegisterDamage(int dmg)
    {
        displayText.SetText(dmg.ToString());
        TriggerFlag();
    }
    public void ResetTarget()
    {
        flagPole.DOLocalRotate(new Vector3(0, 0, 90), 0.5f).SetEase(Ease.OutBack);
        displayText.SetText("--");
    }
    
}
