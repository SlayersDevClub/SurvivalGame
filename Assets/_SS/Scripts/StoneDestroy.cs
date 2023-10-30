using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class StoneDestroy : MonoBehaviour, IWhenDestroy
{
    public Transform dropItemLocation;

    public void ShakeObject()
    {
        if (!GetComponent<DOTweenAnimation>())
        {
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DORewind();
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DOPlayForward();
        } else
        {
            GetComponent<DOTweenAnimation>().DORewind();
            GetComponent<DOTweenAnimation>().DOPlayForward();
        }

    }
    public void Destroy(List<Drop> drops)
    {
        foreach (Drop drop in drops)
        {
            float randomValue = Random.Range(0f, 1f); // Generate a random value between 0 and 1

            if (randomValue <= drop.dropRate) // Check if the random value is less than or equal to the drop rate
            {
                for (int i = 0; i < drop.dropNum; i++)
                {
                    var droppedItem = GameObject.Instantiate(drop.drop, transform.position + Vector3.up * 2, Quaternion.identity);
                    if (dropItemLocation != null)
                    {
                        droppedItem.transform.position = dropItemLocation.position;
                    }
                }
            }
        }

        Destroy(gameObject);
    }
}
