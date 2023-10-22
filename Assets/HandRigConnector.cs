using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class HandRigConnector : MonoBehaviour
{
    FullBodyBipedIK posIK;
    public Transform handTarget;

    // Start is called before the first frame update
    void Start()
    {
        posIK = transform.root.GetComponentInChildren<FullBodyBipedIK>();
    }

    public void SetIKHandPosition()
    {
        if(handTarget != null)
        {
            posIK.solver.rightHandEffector.target = handTarget;
            posIK.solver.rightHandEffector.position = handTarget.position;
            posIK.solver.rightHandEffector.rotation = handTarget.rotation;
            posIK.solver.rightHandEffector.positionWeight = 1f;
            posIK.solver.rightHandEffector.rotationWeight = 1f;
            posIK.GetComponent<HandHolder>().rightHand.GetComponent<HandPoser>().poseRoot = handTarget;
        }

    }
}
