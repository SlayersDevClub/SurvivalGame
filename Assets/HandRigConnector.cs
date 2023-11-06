using UnityEngine;
using RootMotion.FinalIK;
using DG.Tweening;

public class HandRigConnector : MonoBehaviour
{
    public FullBodyBipedIK posIK;
    public Transform 
        rightHandTarget, 
        leftHandTarget, 
        rightElbowTarget;
    public HandPoser
        rightHandPoser,
        leftHandPoser;

    // Start is called before the first frame update
    void Start()
    {
        posIK = transform.root.GetComponentInChildren<FullBodyBipedIK>();
        rightHandPoser = posIK.GetComponent<HandHolder>().rightHand.GetComponent<HandPoser>();
        leftHandPoser = posIK.GetComponent<HandHolder>().leftHand.GetComponent<HandPoser>();
    }

    public void SetIKHandPosition()
    {
        if(rightHandTarget != null)
        {
            rightHandPoser.poseRoot = rightHandTarget;
            posIK.solver.rightHandEffector.target = rightHandTarget;
            posIK.solver.rightHandEffector.position = rightHandTarget.position;
            posIK.solver.rightHandEffector.rotation = rightHandTarget.rotation;
            DOTween.To(() => posIK.solver.rightHandEffector.positionWeight, x => posIK.solver.rightHandEffector.positionWeight = x, 1, 1);
            DOTween.To(() => posIK.solver.rightHandEffector.rotationWeight, x => posIK.solver.rightHandEffector.rotationWeight = x, 1, 1);

            posIK.solver.rightArmChain.bendConstraint.weight = 0.5f;
        }
        else
        {
            posIK.solver.rightHandEffector.positionWeight = 0f;
            posIK.solver.rightHandEffector.rotationWeight = 0f;
        }

        if (leftHandTarget != null)
        {
            leftHandPoser.poseRoot = leftHandTarget;
            posIK.solver.leftHandEffector.target = leftHandTarget;
            posIK.solver.leftHandEffector.position = leftHandTarget.position;
            posIK.solver.leftHandEffector.rotation = leftHandTarget.rotation;
            DOTween.To(() => posIK.solver.leftHandEffector.positionWeight, x => posIK.solver.leftHandEffector.positionWeight = x, 1, 1);
            DOTween.To(() => posIK.solver.leftHandEffector.rotationWeight, x => posIK.solver.leftHandEffector.rotationWeight = x, 1, 1);

        } else
        {
            posIK.solver.leftHandEffector.positionWeight = 0f;
            posIK.solver.leftHandEffector.rotationWeight = 0f;
        }

    }

    public void ResetHands()
    {
        posIK.GetComponent<HandHolder>().leftHand.GetComponent<HandPoser>().poseRoot = null;
        posIK.GetComponent<HandHolder>().rightHand.GetComponent<HandPoser>().poseRoot = null;
        posIK.solver.leftHandEffector.positionWeight = 0f;
        posIK.solver.leftHandEffector.rotationWeight = 0f;
        posIK.solver.rightHandEffector.positionWeight = 0f;
        posIK.solver.rightHandEffector.rotationWeight = 0f;
        posIK.solver.rightArmChain.bendConstraint.weight = 0;
    }

}
