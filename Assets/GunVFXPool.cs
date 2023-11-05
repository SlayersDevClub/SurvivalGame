using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunVFXPool : MonoBehaviour
{
    public List<GameObject> bulletPool;
    public List<GameObject> muzzleFlashPool;
    public List<GameObject> impactFXPool;
    public List<GameObject> gunShotSoundPool;

    public GameObject bulletPrefab, muzzleFlashPrefab, impactFXPrefab, gunShotSound;
    public int amountToPool;

    void Awake()
    {
        bulletPool = new List<GameObject>();
        impactFXPool = new List<GameObject>();
        gunShotSoundPool = new List<GameObject>();

        GameObject tmp;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp = Instantiate(bulletPrefab);
            tmp.SetActive(false);
            bulletPool.Add(tmp);
        }

        GameObject tmp4;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp4 = Instantiate(gunShotSound);
            tmp4.SetActive(false);
            gunShotSoundPool.Add(tmp4);
        }

        GameObject tmp3;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp3 = Instantiate(impactFXPrefab);
            tmp3.SetActive(false);
            impactFXPool.Add(tmp3);
        }
    }

    public void SetupMuzzleFlashPool()
    {
        muzzleFlashPool = new List<GameObject>();
        GameObject tmp2;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp2 = Instantiate(muzzleFlashPrefab);
            tmp2.SetActive(false);
            muzzleFlashPool.Add(tmp2);
        }
    }

    public GameObject GetBullet()
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!bulletPool[i].activeInHierarchy)
            {
                return bulletPool[i];
            }
        }
        return null;
    }
    public GameObject GetMuzzleFlash()
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!muzzleFlashPool[i].activeInHierarchy)
            {
                return muzzleFlashPool[i];
            }
        }
        return null;
    }
    public GameObject GetImpact()
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!impactFXPool[i].activeInHierarchy)
            {
                return impactFXPool[i];
            }
        }
        return null;
    }

    public GameObject GetShotSound()
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!gunShotSoundPool[i].activeInHierarchy)
            {
                return gunShotSoundPool[i];
            }
        }
        return null;
    }
}
