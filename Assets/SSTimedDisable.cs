using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SSTimedDisable : MonoBehaviour
{
    public float timeToDisable = 1;
    // Start is called before the first frame update
    void OnEnable()
    {
        Invoke("DisableMe", timeToDisable);
    }

    void DisableMe()
    {
        this.gameObject.SetActive(false);
    }
}
