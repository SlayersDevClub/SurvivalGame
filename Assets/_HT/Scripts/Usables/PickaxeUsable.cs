using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;

public class PickaxeUsable : MonoBehaviour, IUsable
{
    bool isTimerFinished = true;
    float attackSpeed = 0.2f;

    public void HandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK
        if (context.action.name == TagManager.USE_ACTION)
        {
            if (context.started)
            {
                if (isTimerFinished)
                {
                    SwingTool();
                    StartCoroutine(AttackSpeed(attackSpeed));
                }
            }
        }

        //RIGHT CLICK
        else if (context.action.name == TagManager.USE2_ACTION) {
            Debug.Log("RIGHT CLICKING PICKAXE");
        }
    }

    private IEnumerator AttackSpeed(float countdownDuration)
    {
        float currentTime = countdownDuration;
        isTimerFinished = false;
        while (currentTime > 0)
        {
            yield return new WaitForSeconds(attackSpeed); // Wait for 1 second
            currentTime--;
        }
        // Timer finished
        isTimerFinished = true;
    }

    private void SwingTool()
    {
        DOTween.Restart("DoToolAction");
        DOTween.PlayForward("DoToolAction");
    }

}
