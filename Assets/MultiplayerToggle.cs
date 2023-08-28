using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
public class MultiplayerToggle : MonoBehaviour
{
    public PhotonView view;
    // Start is called before the first frame update
    void Awake()
    {
        if (!view.IsMine) {
            this.gameObject.SetActive(false);
        }
    }

}
