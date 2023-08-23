using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;
public class GunUsable : MonoBehaviour, IUsable
{

    bool isTimerFinished = true, ads = false;
    float shootSpeed = 0.05f;

    private void OnEnable()
    {
        DOTween.Rewind("ADS");
    }
    public void HandleInput(InputAction.CallbackContext context) {

        //LEFT CLICK (FIRE)
        if(context.action.name == TagManager.USE_ACTION) {
            if (context.started)
            {
                if (isTimerFinished)
                {
                    Shoot();
                    StartCoroutine(ShootSpeed(shootSpeed));
                }
            }
           
        }
        //RIGHT CLICK (ADS)
        else if(context.action.name == TagManager.USE2_ACTION) {
            ADS();
        }
        //R RELOAD
        else if(context.action.name == TagManager.RELOAD_ACTION) {
            Debug.Log("RELOADING");
        }
    }

    private IEnumerator ShootSpeed(float countdownDuration)
    {
        float currentTime = countdownDuration;
        isTimerFinished = false;
        while (currentTime > 0)
        {
            yield return new WaitForSeconds(shootSpeed); // Wait for 1 second
            currentTime--;
        }
        // Timer finished
        isTimerFinished = true;
    }

    private void Shoot()
    {
        if (!ads)
        {
            DOTween.Rewind("ADS");
            DOTween.Rewind("ADSShott");
            DOTween.Restart("Shoot");
            DOTween.PlayForward("Shoot");
        } else
        {
            DOTween.Restart("ADSShoot");
            DOTween.Play("ADSShoot");
        }

    }

    void ADS()
    {
        
        if (!ads)
        {
            DOTween.Restart("ADS");
            DOTween.PlayForward("ADS");
            ads = true;
        } else
        {
            DOTween.PlayBackwards("ADS");
            ads = false;
        }
    }

}
