using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;
public class GunUsable : MonoBehaviour, IUsable
{
    Animator gunAnim;
    bool isTimerFinished = true, ads = false;
    float shootSpeed = 0.05f;
    int animTime = 1;
    int currentAnimState;

    private void OnEnable()
    {
        gunAnim = GetComponentInParent<Animator>();
        currentAnimState = gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash;
    }
    private void OnDisable()
    {
        ads = false;
        gunAnim.SetBool("ADSBool", false);
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
        else if(context.action.name == TagManager.USE2_ACTION) 
        {
            ADS();
        }
        //R RELOAD
        else if(context.action.name == TagManager.RELOAD_ACTION) {
            Debug.Log("RELOADING");
        }
    }

    private void Update()
    {
        //If the animator has switched states, reset our time counter and set current
        if (currentAnimState != gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash)
        {
            currentAnimState = gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash;
            animTime = 1;
        }
        //This is randomly set blend factor after each anim loop
        if (gunAnim.GetCurrentAnimatorStateInfo(0).normalizedTime > animTime)
        {
            gunAnim.SetFloat("BlendVal", Random.Range(0f, 1f));
            animTime++;
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
            gunAnim.SetTrigger("Shoot");
        } else
        {
            gunAnim.SetTrigger("ADSShoot");
        }

    }

    void ADS()
    {
        if (!ads)
        {
            ads = true;
            gunAnim.SetBool("ADSBool", ads);
            gunAnim.SetTrigger("ADS");
        } else
        {
            ads = false;
            gunAnim.SetBool("ADSBool", ads);
        }
    }

}
