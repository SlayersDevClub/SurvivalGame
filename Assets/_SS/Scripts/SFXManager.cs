using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXManager : MonoBehaviour
{
    public static SFXManager instance;
    public AudioSource
        craftWood,
        craftMetal,
        craftElectronic,
        collectCoin,
        openChest,
        swingTool,
        slotIn,
        slotOut;

    public AudioSource[] 
        treeFall, 
        woodHit, 
        stoneHit;

    void Start()
    {
        instance = this;
        //treeFall = new AudioSource[]();
    }
    public void PlaySwingTool()
    {
        swingTool.Stop();
        swingTool.pitch = Random.Range(0.9f, 1.1f);
        swingTool.Play();
    }
    public void PlaySlotIn()
    {
        slotIn.Stop();
        slotIn.Play();
    }
    public void PlaySlotOut()
    {
        slotOut.Stop();
        slotOut.Play();
    }
    public void PlayWoodHit()
    {
        var randomIndex = Random.Range(0, woodHit.Length - 1);
        woodHit[randomIndex].Stop();
        woodHit[randomIndex].Play();
    }
    public void PlayStoneHit()
    {
        var randomIndex = Random.Range(0, stoneHit.Length - 1);
        stoneHit[randomIndex].Stop();
        stoneHit[randomIndex].Play();
    }
    public void PlayTreeFall()
    {
        var randomIndex = Random.Range(0,treeFall.Length-1);
        treeFall[randomIndex].Stop();
        treeFall[randomIndex].Play();
    }
    public void PlayCraftWood()
    {
        craftWood.Stop();
        craftWood.Play();
    }
    public void PlayCraftMetal()
    {
        craftMetal.Stop();
        craftMetal.Play();
    }
    public void PlayCraftElectronic()
    {
        craftElectronic.Stop();
        craftElectronic.Play();
    }
    public void PlayCollectCoin()
    {
        collectCoin.Stop();
        collectCoin.Play();
    }
    public void PlayOpenChest()
    {
        openChest.Stop();
        openChest.Play();
    }
}
