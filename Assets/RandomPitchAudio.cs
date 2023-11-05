using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomPitchAudio : MonoBehaviour
{

    // Start is called before the first frame update
    void OnEnable()
    {
        GetComponent<AudioSource>().pitch = Random.Range(0.8f, 1.2f);
    }

}
