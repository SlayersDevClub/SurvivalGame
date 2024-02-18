using UnityEngine;
using UnityEngine.Pool;

public class lols { 
}
public class PooledSFX: MonoBehaviour
{
    public int maxPoolSize = 50;
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
        Destroy(a.gameObject);
    }

    public void Spawn()
    {
        var amount = 20;
        for (int i = 0; i < amount; i++)
        {
            var pooledAudioSource = audioPool.Get();
            //pooledAudioSource.SFXSource.clip = clip;
            
        }
    }
}
