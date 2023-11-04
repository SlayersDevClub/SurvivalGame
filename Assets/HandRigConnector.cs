using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class HandRigConnector : MonoBehaviour
{
    FullBodyBipedIK posIK;
    public Transform rightHandTarget, leftHandTarget, rightElbowTarget;

    // Start is called before the first frame update
    void Start()
    {
        posIK = transform.root.GetComponentInChildren<FullBodyBipedIK>();
    }

    public void SetIKHandPosition()
    {
        if(rightHandTarget != null)
        {
            posIK.GetComponent<HandHolder>().rightHand.GetComponent<HandPoser>().poseRoot = rightHandTarget;
            posIK.solver.rightHandEffector.target = rightHandTarget;
            posIK.solver.rightHandEffector.position = rightHandTarget.position;
            posIK.solver.rightHandEffector.rotation = rightHandTarget.rotation;
            posIK.solver.rightHandEffector.positionWeight = 1f;
            posIK.solver.rightHandEffector.rotationWeight = 1f;
            posIK.solver.rightArmChain.bendConstraint.weight = 0.5f;

        }
        else
        {
            posIK.solver.rightHandEffector.positionWeight = 0f;
            posIK.solver.rightHandEffector.rotationWeight = 0f;
        }

        if (leftHandTarget != null)
        {
            posIK.GetComponent<HandHolder>().leftHand.GetComponent<HandPoser>().poseRoot = leftHandTarget;
            posIK.solver.leftHandEffector.target = leftHandTarget;
            posIK.solver.leftHandEffector.position = leftHandTarget.position;
            posIK.solver.leftHandEffector.rotation = leftHandTarget.rotation;
            posIK.solver.leftHandEffector.positionWeight = 1f;
            posIK.solver.leftHandEffector.rotationWeight = 1f;

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
