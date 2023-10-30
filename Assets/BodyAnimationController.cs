using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class BodyAnimationController : MonoBehaviour
{
    public float animTransitionSpeed = 0.5f;
    PlayerInputReader pir;
    public Animator anim;
    float moveX, moveY;

    // Start is called before the first frame update
    void Start()
    {
        pir = GetComponent<PlayerInputReader>();
    }

    // Update is called once per frame
    void Update()
    {
        DOTween.To(() => moveX, x => moveX = x, pir.GetHorizontalMovementInput(), animTransitionSpeed);
        DOTween.To(() => moveY, x => moveY = x, pir.GetVerticalMovementInput(), animTransitionSpeed);
        anim.SetFloat("XInput", moveX);
        anim.SetFloat("YInput", moveY);
        if (pir.IsJumpKeyPressed()) anim.SetTrigger("Jump");
        else anim.ResetTrigger("Jump");
        if (pir.IsSprintingPressed()) anim.SetBool("Sprint", true);
        else anim.SetBool("Sprint", false);

    }
}
