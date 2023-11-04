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
    bool shooting, readyToShoot, reloading, autoFire;

    //Reference
    PlayerInputReader pir;
    Camera playerCam, fpsCam, skyboxCam;
    public Transform attackPoint, muzzleTarget;
    public float 
        startingFOV = 50, 
        startingEquippedFOV = 30, 
        equippedZoomFOV = 20, 
        zoomFOV = 35;

    //Graphics
    public GameObject muzzleFlash, impactFX;
    public TextMeshProUGUI ammunitionDisplay;

    //bug fixing :D
    public bool allowInvoke = true;



    bool isTimerFinished = true, ads = false;
    public float shootSpeed = 0.25f;
    int animTime = 1;
    int currentAnimState;


    Tween fireTween, adsTween, subtleRockTween;
    float randomSubtleRockAmount = 5f;

    GameObject muzzleFlashFX;

    public void Setup()
    {
        //Prepare gun and variable values
        thisGun = GetComponent<ItemSetup>().GetBaseItemTemplate() as GunTemplate;
        AssignGunStats();

        //Prepare player related variables
        playerRb = transform.root.GetComponent<Rigidbody>();
        pir = playerRb.GetComponent<PlayerInputReader>();

        //Cameras
        fpsCam = GameObject.Find("CameraControls/WorldCam").GetComponent<Camera>();
        playerCam = fpsCam.transform.parent.GetChild(1).GetComponent<Camera>();
        skyboxCam = Camera.main;
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
        var muzzleFlashLoad = Resources.Load<GameObject>("Prefabs/VFX/" + "SS-MuzzleFlash-1");
        muzzleFlashFX = Instantiate(muzzleFlashLoad, muzzleTarget);
        muzzleFlashFX.transform.localPosition = Vector3.zero;

        impactFX = Resources.Load<GameObject>("Prefabs/VFX/" + "ToolHitFX-Wood-Prefab");

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
    }
    void SetupFire()
    {
        subtleRockTween = transform.DOLocalRotate
            (new Vector3(Random.Range(-randomSubtleRockAmount, randomSubtleRockAmount), 0, 0), shootSpeed /2);
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
        reloadTime = thisGun.reloadTime;
        timeBetweenShots = thisGun.timeBetweenShots;
        magazineSize = thisGun.magazineSize;
        bulletsPerTap = thisGun.bulletsPerTap;
        recoilForce = thisGun.recoilForce;

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
                Shoot();
                autoFire = true;
                //InvokeRepeating("Shoot", 0, shootSpeed);
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
    }



    public void EndHandleInput(InputAction.CallbackContext context) {
        
        if(context.action.name == TagManager.USE_ACTION) {
            autoFire = false;
        }
        
    }

    float shotTime;
    void Update()
    {
        if (autoFire)
        {
            if (shotTime < shootSpeed)
            {
                shotTime += Time.deltaTime;
            }
            else
            {
                Shoot();
                shotTime = 0;
            }

        }

        //Set ammo display, if it exists :D
        if (ammunitionDisplay != null)
            ammunitionDisplay.SetText(bulletsLeft / bulletsPerTap + " / " + magazineSize / bulletsPerTap);

        if (pir.IsSprintingPressed())
        {
            if (ads)
                ADS();
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
        shotTime = 0;
        Instantiate(muzzleFlashFX, muzzleTarget);
        fireTween.PlayForward();

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


        //Calculate spread
        float x = Random.Range(-spread, spread);
        float y = Random.Range(-spread, spread);

        //Calculate new direction with spread
        Vector3 directionWithSpread = directionWithoutSpread + new Vector3(x, y, 0); //Just add spread to last direction

        Debug.DrawRay(muzzleFlashFX.transform.position, directionWithoutSpread, Color.red);

        //Instantiate bullet/projectile
        GameObject currentBullet = Instantiate(bullet, attackPoint.position, Quaternion.identity); //store instantiated bullet in currentBullet
        //Rotate bullet to shoot direction
        currentBullet.transform.forward = directionWithSpread.normalized;

        //Add forces to bullet
        currentBullet.GetComponent<Rigidbody>().AddForce(directionWithSpread.normalized * shootForce, ForceMode.Impulse);
        currentBullet.GetComponent<Rigidbody>().AddForce(fpsCam.transform.up * upwardForce, ForceMode.Impulse);

        var _impactFX = GameObject.Instantiate(impactFX);
        _impactFX.transform.position = targetPoint;

        print("////===|| Shooting ||===o . . . . . . . . . ==>");
    }

    void ADS()
    {
        //if (pir.IsSprintingPressed()) return;
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
