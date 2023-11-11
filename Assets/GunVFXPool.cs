using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunVFXPool : MonoBehaviour
{
    public List<GameObject> bulletPool;
    public List<GameObject> muzzleFlashPool;
    public List<GameObject> impactFXPool;
    public List<GameObject> gunShotSoundPool;
    public List<GameObject> surfaceImpactFXPool;
    public List<GameObject> gunEmptyPool;

    public GameObject 
        bulletPrefab, 
        muzzleFlashPrefab, 
        impactFXPrefab, 
        gunShotSound, 
        surfaceImpactFX,
        gunEmptySFX;
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

        GameObject tmp5;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp5 = Instantiate(surfaceImpactFX);
            tmp5.SetActive(false);
            surfaceImpactFXPool.Add(tmp5);
        }
        GameObject tmp6;
        for (int i = 0; i < amountToPool; i++)
        {
            tmp6 = Instantiate(gunEmptySFX);
            tmp6.SetActive(false);
            gunEmptyPool.Add(tmp6);
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
    public GameObject GetSurfaceImpactFX(Vector3 impactPosition, Vector3 impactDirection)
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!surfaceImpactFXPool[i].activeInHierarchy)
            {
                surfaceImpactFXPool[i].transform.eulerAngles = impactDirection;
                surfaceImpactFXPool[i].transform.position = impactPosition;
                return surfaceImpactFXPool[i];
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
    public GameObject GetEmptyFireSound()
    {
        for (int i = 0; i < amountToPool; i++)
        {
            if (!gunEmptyPool[i].activeInHierarchy)
            {
                return gunEmptyPool[i];
            }
        }
        return null;
    }
}
