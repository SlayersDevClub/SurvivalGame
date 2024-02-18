using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Pool;

public class ClientSFXManager : MonoBehaviour
{
    public int maxPoolSize = 50;
    public AudioSFX audioData;
    public IObjectPool<AudioSFXObject> audioPool
    {
        get
        {
            if (_audioPool == null)
            {
                _audioPool = new ObjectPool<AudioSFXObject>
                   (
                    CreatePooledItem,
                    OnTakeFromPool,
                    OnReturnToPool,
                    OnDestroyPoolObject,
                    true,
                    100,
                    maxPoolSize
                    );
            }
            return _audioPool;
        }
    }
    private IObjectPool<AudioSFXObject> _audioPool;
    private AudioSFXObject CreatePooledItem()
    {
        var tempAudioSource = new GameObject().AddComponent<AudioSFXObject>();
        return tempAudioSource;
    }
    private void OnReturnToPool(AudioSFXObject a)
    {
        a.gameObject.SetActive(false);
    }

    private void OnTakeFromPool(AudioSFXObject a)
    {
        a.gameObject.SetActive(true);
    }

    private void OnDestroyPoolObject(AudioSFXObject a)
    {

    }

    public void CreateAudioSourcePool()
    {
        var amount = 20;
        for (int i = 0; i < amount; i++)
        {
            var pooledAudioSource = audioPool.Get();
        }
    }
}
