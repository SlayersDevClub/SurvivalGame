using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunAssembler : MonoBehaviour
{
    GameObject gunBody, bodyMagJoint, bodySightJoint, bodyBarrelJoint, bodyStockJoint, bodyGripJoint;

    public GameObject gunMag, gunSight, gunBarrel, gunStock, gunGrip;

    private void Start() {
        gunBody = GameObject.Find("Body");

         bodyMagJoint = gunBody.transform.Find("BodyMagJoint").gameObject;
         bodySightJoint = gunBody.transform.Find("BodySightJoint").gameObject;
         bodyBarrelJoint = gunBody.transform.Find("BodyBarrelJoint").gameObject;
         bodyStockJoint = gunBody.transform.Find("BodyStockJoint").gameObject;
         bodyGripJoint = gunBody.transform.Find("BodyGripJoint").gameObject;
    }

    public void AssembleGun() {
        Instantiate(gunMag, bodyMagJoint.transform.position, Quaternion.identity, gunBody.transform);
        Instantiate(gunSight, bodySightJoint.transform.position, Quaternion.identity, gunBody.transform);
        Instantiate(gunBarrel, bodyBarrelJoint.transform.position, Quaternion.identity, gunBody.transform);
        Instantiate(gunStock, bodyStockJoint.transform.position, Quaternion.identity, gunBody.transform);
        Instantiate(gunGrip, bodyGripJoint.transform.position, Quaternion.identity, gunBody.transform);
    }

}
