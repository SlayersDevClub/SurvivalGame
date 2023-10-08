using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;
using TMPro;

public class GunUsable : MonoBehaviour, IUsable
{
    //gun
    private GunTemplate thisGun;

    //bullet 
    public GameObject bullet;

//bullet force
public float shootForce, upwardForce;

//Gun stats
public float timeBetweenShooting, spread, reloadTime, timeBetweenShots;
public int magazineSize, bulletsPerTap;
public bool allowButtonHold;

int bulletsLeft, bulletsShot;

//Recoil
public Rigidbody playerRb;
public float recoilForce;

//bools
bool shooting, readyToShoot, reloading;

//Reference
public Camera fpsCam;
public Transform attackPoint;

//Graphics
public GameObject muzzleFlash;
public TextMeshProUGUI ammunitionDisplay;

//bug fixing :D
public bool allowInvoke = true;


Animator gunAnim;
    bool isTimerFinished = true, ads = false;
    float shootSpeed = 0.05f;
    int animTime = 1;
    int currentAnimState;

    public void Setup()
    {
        //Prepare gun and variable values
        thisGun = GetComponent<ItemSetup>().GetBaseItemTemplate() as GunTemplate;
        AssignGunStats();

        //Prepare player related variables
        playerRb = transform.root.GetComponent<Rigidbody>();
        fpsCam = GameObject.Find("CameraControls/WorldCam").GetComponent<Camera>();


        gunAnim = GetComponentInParent<Animator>();
        currentAnimState = gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash;

        bulletsLeft = magazineSize;
        readyToShoot = true;

        
    }

    private void AssignGunStats() {
        shootForce = thisGun.shootForce;
        upwardForce = thisGun.upwardForce;
        timeBetweenShooting = thisGun.timeBetweenShooting;
        spread = thisGun.spread;
        reloadTime = thisGun.reloadTime;
        timeBetweenShots = thisGun.timeBetweenShots;
        magazineSize = thisGun.magazineSize;
        bulletsPerTap = thisGun.bulletsPerTap;
        recoilForce = thisGun.recoilForce;

        attackPoint = transform.Find("body(Clone)");
        bullet = Resources.Load<GameObject>("Prefabs/Bullets/StandardBullet");
    }

    private void Start() {
        gunAnim = GetComponentInParent<Animator>();
        currentAnimState = gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash;

        bulletsLeft = magazineSize;
        readyToShoot = true;
    }


    
    public void StartHandleInput(InputAction.CallbackContext context) {
        /*
        //LEFT CLICK (FIRE)
        if(context.action.name == TagManager.USE_ACTION) {
            if (context.started)
            {
                if (isTimerFinished)
                {
                    InvokeRepeating("Shoot", 0, shootSpeed);
                }
            }
           
        }
        //RIGHT CLICK (ADS)
        else if(context.action.name == TagManager.USE2_ACTION) 
        {
            ADS();
        }
        //R RELOAD
        else if(context.action.name == TagManager.RELOAD_ACTION) {
            Debug.Log("RELOADING");
        }
        */
    }


    public void EndHandleInput(InputAction.CallbackContext context) {
        /*
        if(context.action.name == TagManager.USE_ACTION) {
            CancelInvoke();
        }
        */
    }
    

    private void Update()
    {
        //If the animator has switched states, reset our time counter and set current
        if (currentAnimState != gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash)
        {
            currentAnimState = gunAnim.GetCurrentAnimatorStateInfo(0).shortNameHash;
            animTime = 1;
        }
        //This is randomly set blend factor after each anim loop
        if (gunAnim.GetCurrentAnimatorStateInfo(0).normalizedTime > animTime)
        {
            gunAnim.SetFloat("BlendVal", Random.Range(0f, 1f));
            animTime++;
        }

        //SHOOTING CODE
        MyInput();

        //Set ammo display, if it exists :D
        if (ammunitionDisplay != null)
            ammunitionDisplay.SetText(bulletsLeft / bulletsPerTap + " / " + magazineSize / bulletsPerTap);
    }

    private IEnumerator ShootSpeed(float countdownDuration)
    {
        float currentTime = countdownDuration;
        isTimerFinished = false;
        while (currentTime > 0)
        {
            yield return new WaitForSeconds(shootSpeed); // Wait for 1 second
            currentTime--;
        }
        // Timer finished
        isTimerFinished = true;
    }

    private void Shoot()
    {
        if (!ads)
        {
            gunAnim.SetTrigger("Shoot");
        } else
        {
            gunAnim.SetTrigger("ADSShoot");
        }

    }

    void ADS()
    {
        if (!ads)
        {
            ads = true;
            gunAnim.SetBool("ADSBool", ads);
            gunAnim.SetTrigger("ADS");
        } else
        {
            ads = false;
            gunAnim.SetBool("ADSBool", ads);
        }
    }

    


    private void Awake() {
        Debug.Log("AWAKINMG");
        //make sure magazine is full
        
    }


    private void MyInput() {
        Debug.Log("INPOUTINMG");
        //Check if allowed to hold down button and take corresponding input
        if (allowButtonHold) shooting = Input.GetKey(KeyCode.Mouse0);
        else shooting = Input.GetKeyDown(KeyCode.Mouse0);

        //Reloading 
        if (Input.GetKeyDown(KeyCode.R) && bulletsLeft < magazineSize && !reloading) Reload();
        //Reload automatically when trying to shoot without ammo
        if (readyToShoot && shooting && !reloading && bulletsLeft <= 0) Reload();

        //Shooting
        if (readyToShoot && shooting && !reloading && bulletsLeft > 0) {
            //Set bullets shot to 0
            bulletsShot = 0;

            ShootBullet();
        }
    }

    private void ShootBullet() {
        Debug.Log("SHOOTING");
        readyToShoot = false;

        //Find the exact hit position using a raycast
        Ray ray = fpsCam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0)); //Just a ray through the middle of your current view
        RaycastHit hit;

        //check if ray hits something
        Vector3 targetPoint;
        if (Physics.Raycast(ray, out hit))
            targetPoint = hit.point;
        else
            targetPoint = ray.GetPoint(75); //Just a point far away from the player

        //Calculate direction from attackPoint to targetPoint
        Vector3 directionWithoutSpread = targetPoint - attackPoint.position;

        //Calculate spread
        float x = Random.Range(-spread, spread);
        float y = Random.Range(-spread, spread);

        //Calculate new direction with spread
        Vector3 directionWithSpread = directionWithoutSpread + new Vector3(x, y, 0); //Just add spread to last direction

        //Instantiate bullet/projectile
        GameObject currentBullet = Instantiate(bullet, attackPoint.position, Quaternion.identity); //store instantiated bullet in currentBullet
        //Rotate bullet to shoot direction
        currentBullet.transform.forward = directionWithSpread.normalized;

        //Add forces to bullet
        currentBullet.GetComponent<Rigidbody>().AddForce(directionWithSpread.normalized * shootForce, ForceMode.Impulse);
        currentBullet.GetComponent<Rigidbody>().AddForce(fpsCam.transform.up * upwardForce, ForceMode.Impulse);

        //Instantiate muzzle flash, if you have one
        if (muzzleFlash != null)
            Instantiate(muzzleFlash, attackPoint.position, Quaternion.identity);

        bulletsLeft--;
        bulletsShot++;

        //Invoke resetShot function (if not already invoked), with your timeBetweenShooting
        if (allowInvoke) {
            Invoke("ResetShot", timeBetweenShooting);
            allowInvoke = false;

            //Add recoil to player (should only be called once)
            playerRb.AddForce(-directionWithSpread.normalized * recoilForce, ForceMode.Impulse);
        }

        //if more than one bulletsPerTap make sure to repeat shoot function
        if (bulletsShot < bulletsPerTap && bulletsLeft > 0)
            Invoke("ShootBullet", timeBetweenShots);
    }
    private void ResetShot() {
        //Allow shooting and invoking again
        readyToShoot = true;
        allowInvoke = true;
    }

    private void Reload() {
        reloading = true;
        Invoke("ReloadFinished", reloadTime); //Invoke ReloadFinished function with your reloadTime as delay
    }
    private void ReloadFinished() {
        //Fill magazine
        bulletsLeft = magazineSize;
        reloading = false;
    }



}
