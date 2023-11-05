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
    public float 
        timeBetweenShooting, 
        spread, 
        reloadTime = 1, 
        timeBetweenShots;
    public int 
        magazineSize = 30, 
        bulletsPerTap;
    public bool allowButtonHold;

    int bulletsLeft, bulletsShot;

    //Recoil
    public Rigidbody playerRb;
    public float recoilForce;

    //bools
    bool 
        shooting, 
        readyToShoot, 
        reloading, 
        autoFire, 
        sprinting;

    //Poolers
    GunVFXPool gunFXPool;

    //Reference
    PlayerInputReader pir;
    Camera 
        playerCam, 
        fpsCam, 
        skyboxCam;
    public Transform 
        attackPoint, 
        muzzleTarget;
    public float 
        startingFOV = 50, 
        startingEquippedFOV = 30, 
        equippedZoomFOV = 20, 
        zoomFOV = 35;

    //Graphics
    public TextMeshProUGUI ammunitionDisplay;

    //bug fixing :D
    public bool allowInvoke = true;

    bool isTimerFinished = true, ads = false;
    public float shootSpeed = 0.15f;
    int animTime = 1;
    int currentAnimState;


    Tween 
        fireTween, 
        adsTween, 
        subtleRockTween,
        walkBounceTween,
        sprintTween;
    float randomSubtleRockAmount = 5f, nextFire;

    public void Setup()
    {
        //Ref for gun fx and setting up muzzleflashpool
        gunFXPool = GetComponentInParent<GunVFXPool>();
        gunFXPool.SetupMuzzleFlashPool();

        //Prepare gun and variable values
        thisGun = GetComponent<ItemSetup>().GetBaseItemTemplate() as GunTemplate;
        AssignGunStats();

        //Prepare player related variables
        playerRb = transform.root.GetComponent<Rigidbody>();
        pir = playerRb.GetComponent<PlayerInputReader>();

        //Cameras
        fpsCam = GameObject.Find("CameraControls/WorldCam").GetComponent<Camera>();
        playerCam = fpsCam.transform.parent.GetChild(1).GetComponent<Camera>();
        skyboxCam = transform.root.Find("SkyboxCam").GetComponent<Camera>();
        startingFOV = fpsCam.fieldOfView;
        startingEquippedFOV = playerCam.fieldOfView;

        bulletsLeft = magazineSize;
        readyToShoot = true;

        //Muzzle Flash Position found as child of barrel
        foreach(Transform child in GetComponentsInChildren<Transform>())
        {
            if(child.name == "MuzzleTarget")
            {
                muzzleTarget = child;
                break;
            }
        }

        //Ammo Canvas
        foreach(Transform child in GetComponentsInChildren<Transform>())
        {
            if(child.name == "AmmoCounter")
            {
                ammunitionDisplay = child.GetComponent<TextMeshProUGUI>();
            }
        }

        //Hands poser setup
        if (transform.parent.GetComponent<HandRigConnector>())
        {
            foreach (Transform child in GetComponentsInChildren<Transform>())
            {
                if (child.CompareTag("LeftHandTarget"))
                {
                    print("found left hand");
                    transform.parent.GetComponent<HandRigConnector>().leftHandTarget = child.GetChild(0);
                }

                if (child.CompareTag("RightHandTarget"))
                {
                    transform.parent.GetComponent<HandRigConnector>().rightHandTarget = child.GetChild(0);
                }
            }
            transform.parent.GetComponent<HandRigConnector>().SetIKHandPosition();
        }

        //Tweener setup
        fireTween = transform.parent.DOLocalMoveY(0.2f, shootSpeed/2).OnPlay(SetupFire);
        fireTween.SetLoops(2, LoopType.Yoyo);
        //fireTween.SetEase(Ease.InCirc);
        fireTween.SetAutoKill(false);    
        fireTween.OnComplete(RestartFireTween);
        fireTween.SetRelative(true);
        fireTween.Pause();

        adsTween = transform.parent.DOLocalMove(new Vector3(-0.07f, -.1f, -0.1175f), .25f);
        adsTween.SetEase(Ease.InQuad);
        adsTween.Pause();
        adsTween.SetRelative(true);
        adsTween.SetAutoKill(false);

        subtleRockTween.SetLoops(2, LoopType.Yoyo);
        subtleRockTween.OnPlay(RandomizeSubtleRockTween);
        subtleRockTween.SetAutoKill(false);
        subtleRockTween.SetRelative(true);
        subtleRockTween.Pause();

        walkBounceTween.SetLoops(2, LoopType.Yoyo);
        walkBounceTween.OnPlay(SetupwalkBounceTween);
        walkBounceTween.SetAutoKill(false);
        walkBounceTween.SetRelative(true);
        walkBounceTween.Pause();

        sprintTween = transform.parent.DOLocalRotate(new Vector3(50, -20, 90), 0.3f);
        sprintTween.SetAutoKill(false);
        sprintTween.Pause();
    }
    void SetupwalkBounceTween()
    {
        walkBounceTween = transform.parent.DOLocalMoveX(0.1f, 0.3f).SetEase(Ease.InCirc);
    }
    void SetupFire()
    {
        subtleRockTween = transform.DOLocalRotate
            (new Vector3(Random.Range(-randomSubtleRockAmount, randomSubtleRockAmount), 0, 0), shootSpeed /2, RotateMode.Fast);
        subtleRockTween.SetLoops(2, LoopType.Yoyo);
        subtleRockTween.Rewind();
        subtleRockTween.PlayForward();
    }
    void RandomizeSubtleRockTween()
    {
        subtleRockTween.Rewind();
        randomSubtleRockAmount = Random.Range(-randomSubtleRockAmount, randomSubtleRockAmount);

    }
    void RestartFireTween()
    {
        fireTween.Rewind();
    }

    private void AssignGunStats() {
        shootForce = thisGun.shootForce;
        upwardForce = thisGun.upwardForce;
        timeBetweenShooting = thisGun.timeBetweenShooting;
        spread = thisGun.spread;

        //Need to fix this
        //reloadTime = thisGun.reloadTime;

        //Need to fix this
        //magazineSize = thisGun.magazineSize;

        bulletsPerTap = thisGun.bulletsPerTap;
        recoilForce = thisGun.recoilForce;
        timeBetweenShots = thisGun.timeBetweenShots;

        attackPoint = transform.Find("body(Clone)");
        bullet = Resources.Load<GameObject>("Prefabs/Bullets/StandardBullet");
    }

    void Start() {

        bulletsLeft = magazineSize;
        readyToShoot = true;
    }


    public void StartHandleInput(InputAction.CallbackContext context) {
        //LEFT CLICK (FIRE)
        if(context.action.name == TagManager.USE_ACTION) {
            if (context.started)
            {
                autoFire = true;
            }
        }
        //RIGHT CLICK (ADS)
        else if(context.action.name == TagManager.USE2_ACTION) 
        {
            if(!sprinting)
                ADS();
        }
        //R RELOAD
        else if(context.action.name == TagManager.RELOAD_ACTION) {
            Reload();
        }
    }
    public void EndHandleInput(InputAction.CallbackContext context) {
        
        if(context.action.name == TagManager.USE_ACTION) {
            autoFire = false;
        }      
    }


    void Update()
    {
        //Autofire
        if(autoFire && Time.time > nextFire && !sprinting)
        {
            Shoot();
            nextFire = Time.time + shootSpeed;
        }

        //Set ammo display, if it exists :D
        if (ammunitionDisplay != null)
            ammunitionDisplay.SetText(bulletsLeft + " / " + magazineSize);

        if(pir.GetHorizontalMovementInput() > 0 || pir.GetVerticalMovementInput() > 0)
        {
            walkBounceTween.Play();
        }

        //Sprinting
        if (pir.IsSprintingPressed())
        {
            sprintTween.PlayForward();
            sprinting = true;

            if (ads) ADS();

        } else if (sprintTween.IsComplete() || sprintTween.IsPlaying())
        {
            sprintTween.PlayBackwards();
            sprinting = false;
        }
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
        if (bulletsLeft <= 0) return;
        else
        {
            bulletsLeft--;

            //fireTween.Rewind();
            fireTween.PlayForward();

            GameObject muzzleFlash = gunFXPool.GetMuzzleFlash();
            muzzleFlash.transform.position = muzzleTarget.position;
            muzzleFlash.transform.rotation = muzzleTarget.rotation;
            muzzleFlash.transform.parent = muzzleTarget;
            muzzleFlash.SetActive(true);

            //Find the exact hit position using a raycast
            Ray ray = fpsCam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
            RaycastHit hit;
            Vector3 targetPoint;
            if (Physics.Raycast(ray, out hit))
                targetPoint = hit.point;
            else
                targetPoint = ray.GetPoint(75); //Just a point far away from the player

            //Calculate direction from attackPoint to targetPoint
            Vector3 directionWithoutSpread = targetPoint - attackPoint.position;
            Debug.DrawRay(muzzleTarget.position, directionWithoutSpread, Color.red);

            //Calculate spread
            float x = Random.Range(-spread, spread);
            float y = Random.Range(-spread, spread);

            //Calculate new direction with spread
            Vector3 directionWithSpread = directionWithoutSpread + new Vector3(x, y, 0); //Just add spread to last direction

            //Instantiate bullet/projectile
            GameObject currentBullet = gunFXPool.GetBullet();
            currentBullet.transform.position = attackPoint.position;
            currentBullet.transform.rotation = attackPoint.rotation;
            currentBullet.transform.forward = directionWithSpread.normalized;
            currentBullet.SetActive(true);

            //Add forces to bullet
            currentBullet.GetComponent<Rigidbody>().AddForce(directionWithSpread.normalized * shootForce, ForceMode.Impulse);
            currentBullet.GetComponent<Rigidbody>().AddForce(fpsCam.transform.up * upwardForce, ForceMode.Impulse);

            GameObject gunShotAudio = gunFXPool.GetShotSound();
            gunShotAudio.transform.position = muzzleTarget.position;
            gunShotAudio.SetActive(true);

            GameObject impactFX = gunFXPool.GetImpact();
            impactFX.transform.position = targetPoint;
            impactFX.SetActive(true);

            print("////===|| Shooting ||===o . . . . . . . . . ==>");
        }
    }

    void ADS()
    {
        if (!ads)
        {
            ads = true;
            adsTween.PlayForward();
            fpsCam.DOFieldOfView(zoomFOV, .5f);
            playerCam.DOFieldOfView(equippedZoomFOV, .25f);
            skyboxCam.DOFieldOfView(zoomFOV, .5f);
            transform.parent.parent.GetComponent<UnityEngine.Animations.PositionConstraint>().weight = .9f;
        } else
        {
            ads = false;
            adsTween.PlayBackwards();
            fpsCam.DOFieldOfView(startingFOV, .25f);
            skyboxCam.DOFieldOfView(startingFOV, .35f);
            playerCam.DOFieldOfView(startingEquippedFOV, .25f);
            transform.parent.parent.GetComponent<UnityEngine.Animations.PositionConstraint>().weight = .1f;
        }
    }


    //private void MyInput() {
    //    //Check if allowed to hold down button and take corresponding input
    //    if (allowButtonHold) shooting = Input.GetKey(KeyCode.Mouse0);
    //    else shooting = Input.GetKeyDown(KeyCode.Mouse0);

    //    //Reloading 
    //    if (Input.GetKeyDown(KeyCode.R) && bulletsLeft < magazineSize && !reloading) Reload();
    //    //Reload automatically when trying to shoot without ammo
    //    if (readyToShoot && shooting && !reloading && bulletsLeft <= 0) Reload();

    //    //Shooting
    //    if (readyToShoot && shooting && !reloading && bulletsLeft > 0) {
    //        //Set bullets shot to 0
    //        bulletsShot = 0;

    //        ShootBullet();
    //    }
    //}

    //private void ShootBullet() {
    //    Debug.Log("SHOOTING");
    //    readyToShoot = false;

    //    //Find the exact hit position using a raycast
    //    Ray ray = fpsCam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0)); 
    //    RaycastHit hit;
    //    Vector3 targetPoint;
    //    if (Physics.Raycast(ray, out hit))
    //        targetPoint = hit.point;
    //    else
    //        targetPoint = ray.GetPoint(75); //Just a point far away from the player

    //    //Calculate direction from attackPoint to targetPoint
    //    Vector3 directionWithoutSpread = targetPoint - attackPoint.position;

    //    //Calculate spread
    //    float x = Random.Range(-spread, spread);
    //    float y = Random.Range(-spread, spread);

    //    //Calculate new direction with spread
    //    Vector3 directionWithSpread = directionWithoutSpread + new Vector3(x, y, 0); //Just add spread to last direction

    //    //Instantiate bullet/projectile
    //    GameObject currentBullet = Instantiate(bullet, attackPoint.position, Quaternion.identity); //store instantiated bullet in currentBullet
    //    //Rotate bullet to shoot direction
    //    currentBullet.transform.forward = directionWithSpread.normalized;

    //    //Add forces to bullet
    //    currentBullet.GetComponent<Rigidbody>().AddForce(directionWithSpread.normalized * shootForce, ForceMode.Impulse);
    //    currentBullet.GetComponent<Rigidbody>().AddForce(fpsCam.transform.up * upwardForce, ForceMode.Impulse);

    //    //Instantiate muzzle flash, if you have one
    //    if (muzzleFlash != null)
    //        Instantiate(muzzleFlash, attackPoint.position, Quaternion.identity);

    //    bulletsLeft--;
    //    bulletsShot++;

    //    //Invoke resetShot function (if not already invoked), with your timeBetweenShooting
    //    if (allowInvoke) {
    //        Invoke("ResetShot", timeBetweenShooting);
    //        allowInvoke = false;

    //        //Add recoil to player (should only be called once)
    //        playerRb.AddForce(-directionWithSpread.normalized * recoilForce, ForceMode.Impulse);
    //    }

    //    //if more than one bulletsPerTap make sure to repeat shoot function
    //    if (bulletsShot < bulletsPerTap && bulletsLeft > 0)
    //        Invoke("ShootBullet", timeBetweenShots);
    //}
    //private void ResetShot() {
    //    //Allow shooting and invoking again
    //    readyToShoot = true;
    //    allowInvoke = true;
    //}

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
