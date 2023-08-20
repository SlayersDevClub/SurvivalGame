using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoOnDisable : MonoBehaviour
{
    private void OnDisable()
    {
        GetComponent<DG.Tweening.DOTweenAnimation>().DORewind();
    }

    private void OnEnable()
    {
        GetComponent<DG.Tweening.DOTweenAnimation>().DOPlayForward();
    }
}
