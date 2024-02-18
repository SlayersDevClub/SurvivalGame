public class SFXManager : Singleton<SFXManager>
{
    private PooledSFX _pool;
    public AudioSFX audioData;

    private void Start()
    {
        _pool = gameObject.AddComponent<PooledSFX>();
        _pool.Spawn();
    }

    public void PlayStoneHit()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.stoneHit;
        sound.SFXSource.Play();
    }
    public void PlaySwingTool()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.swingTool;
        sound.SFXSource.Play();
    }
    public void PlayOpenChest()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.openChest;
        sound.SFXSource.Play();
    }
    public void PlayTreeFall()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.treeFall;
        sound.SFXSource.Play();
    }
    public void PlayCraftMetal()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.craftMetal;
        sound.SFXSource.Play();
    }
    public void PlayCraftWood()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.craftWood;
        sound.SFXSource.Play();
    }
    public void PlayCraftElectronic()
    {
        var sound = _pool.audioPool.Get();
        sound.SFXSource.clip = audioData.craftElectronic;
        sound.SFXSource.Play();
    }

}
