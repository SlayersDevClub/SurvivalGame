using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class TreeDestroy : MonoBehaviour, IWhenDestroy {
    public Transform treeTrunk;
    public float fallSpeed = 1.5f;
    public ParticleSystem droplings;
    bool isFalling = false;

    public void ShakeObject()
    {
        transform.GetChild(0).GetComponent<DOTweenAnimation>().DORewind();
        transform.GetChild(0).GetComponent<DOTweenAnimation>().DOPlayForward();
        droplings.Stop();
        droplings.Play();
    }

    public void Destroy(List<Drop> drops)
    {
        foreach (Drop drop in drops)
        {
            float randomValue = Random.Range(0f, 1f); // Generate a random value between 0 and 1

            if (randomValue <= drop.dropRate) // Check if the random value is less than or equal to the drop rate
            {
                for (int i = 0; i < drop.dropNum; i++) {
                    GameObject.Instantiate(drop.drop, transform.position + Vector3.up *2, Quaternion.identity);
                }
            }
        }

        if (treeTrunk != null)
        {
            foreach (Transform child in transform)
            {
                child.gameObject.SetActive(false);
            }
            treeTrunk.gameObject.SetActive(true);

            ////Tree falls to the the right only - need to find better way to react to slanted terrain.
            DOTween.To(() => treeTrunk.GetChild(0).localEulerAngles,
                x => treeTrunk.GetChild(0).localEulerAngles = x, 
                -102 * Vector3.forward,
                fallSpeed)
                .OnStart(DisableCollider)
                .OnComplete(RemoveTree)
                .SetEase(Ease.OutBounce).SetLoops(0, LoopType.Restart);
            
        }
        else Destroy(gameObject);
    }

    void RemoveTree()
    {
        treeTrunk.parent = null;
        treeTrunk.GetChild(0).gameObject.SetActive(false);
        treeTrunk.GetChild(1).GetComponent<Collider>().enabled = true;
    }

    void DisableCollider()
    {
        SFXManager.instance.PlayTreeFall();
        transform.GetChild(0).GetComponent<Collider>().enabled = false;
        treeTrunk.GetChild(1).GetComponent<Collider>().enabled = false;
    }
}
