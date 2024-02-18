using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class AudioSFXObject : MonoBehaviour
{
    public IObjectPool<AudioSFXObject> Pool {get;set;}
    public AudioSource SFXSource;

    private void OnEnable()
    {
        if (SFXSource == null)
            SFXSource = gameObject.AddComponent<AudioSource>();
        else
            SFXSource = GetComponent<AudioSource>();

        SFXSource.playOnAwake = false;
    }
    public void SetAudioClip(AudioClip clip)
    {
        SFXSource.clip = clip;
    }
    private void ReturnToPool()
    {
        Pool.Release(this);
    }

}
