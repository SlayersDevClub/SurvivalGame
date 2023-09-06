using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class GunAssembler {
    public static GameObject AssembleGun(GameObject gunBody, GameObject gunMag, GameObject gunSight, GameObject gunBarrel, GameObject gunStock, GameObject gunGrip) {
        // Create the root object for the assembled gun.
        GameObject assembledGun = new GameObject("AssembledGun");

        // Instantiate and attach the body to the root object.
        GameObject instantiatedBody = GameObject.Instantiate(gunBody, assembledGun.transform);

        // Get the joints for other gun parts on the body.
        Transform bodyMagJoint = instantiatedBody.transform.GetChild(0).Find("BodyMagJoint");
        Transform bodySightJoint = instantiatedBody.transform.GetChild(0).Find("BodySightJoint");
        Transform bodyBarrelJoint = instantiatedBody.transform.GetChild(0).Find("BodyBarrelJoint");
        Transform bodyStockJoint = instantiatedBody.transform.GetChild(0).Find("BodyStockJoint");
        Transform bodyGripJoint = instantiatedBody.transform.GetChild(0).Find("BodyGripJoint");

        // Instantiate and attach other gun parts to the corresponding joints on the body.
        GameObject.Instantiate(gunMag, bodyMagJoint.position, bodyMagJoint.rotation, assembledGun.transform);
        GameObject.Instantiate(gunSight, bodySightJoint.position, bodySightJoint.rotation, assembledGun.transform);
        GameObject.Instantiate(gunBarrel, bodyBarrelJoint.position, bodyBarrelJoint.rotation, assembledGun.transform);
        GameObject.Instantiate(gunStock, bodyStockJoint.position, bodyStockJoint.rotation, assembledGun.transform);
        GameObject.Instantiate(gunGrip, bodyGripJoint.position, bodyGripJoint.rotation, assembledGun.transform);

        // Return the root object for the assembled gun.
        return assembledGun;
    }
}
