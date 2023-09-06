using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeDestroy : MonoBehaviour, IWhenDestroy {
    public void Destroy(List<Drop> drops) {
        foreach (Drop drop in drops) {
            float randomValue = Random.Range(0f, 1f); // Generate a random value between 0 and 1

            if (randomValue <= drop.dropRate) // Check if the random value is less than or equal to the drop rate
            {
                for (int i = 0; i < drop.dropNum; i++) {
                    GameObject.Instantiate(drop.drop, transform.position, Quaternion.identity);
                }
            }
        }

        Destroy(gameObject);
    }
}
