using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;
using TMPro;
using Gamekit3D;

public class GunUsable : MonoBehaviour, IUsable {

    private GunTemplate thisGun;    // gun
    public GameObject bullet;       // bullet

    //bullet force
    public float shootForce = 1, upwardForce;

    //Gun stats
    public float 
        timeBetweenShooting, 
        spread,
        reloadTime = .4f,
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
    private bool 
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
    private float 
        startingFOV = 50, 
        startingEquippedFOV = 30, 
        equippedZoomFOV = 20, 
        zoomFOV = 35;

    //Graphics
    public TextMeshProUGUI ammunitionDisplay;

    private bool isTimerFinished = true, ads = false;
    public float shootSpeed = 0.15f;
    private int animTime = 1;
    private int currentAnimState;

    private Tween
        fireTween,
        adsTween,
        subtleRockTween,
        walkBounceTween,
        sprintTween,
        magTween,
        pullOutTween;
    private float randomSubtleRockAmount = 5f, nextFire;

    Transform magHand;
    HandRigConnector handRig;
    GameObject bulletCasingVFX;
    Transform defaultHand;

    public void Setup() {
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
        //{
        fpsCam = GameObject.Find("CameraControls/WorldCam").GetComponent<Camera>();
        playerCam = fpsCam.transform.parent.GetChild(1).GetComponent<Camera>();
        skyboxCam = transform.root.Find("SkyboxCam").GetComponent<Camera>();
        startingFOV = fpsCam.fieldOfView;
        startingEquippedFOV = playerCam.fieldOfView;
        //}

        bulletsLeft = magazineSize;
        readyToShoot = true;

        handRig = GetComponentInParent<HandRigConnector>() ?? null;

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
        if (handRig)
        {
            foreach (Transform child in GetComponentsInChildren<Transform>())
            {
                if (child.name.Contains("mag"))
                {
                    magHand = child.GetChild(0);
                }
                if (child.CompareTag("LeftHandTarget"))
                {
                    print("found left hand");
                    handRig.leftHandTarget = child.GetChild(0);
                }

                if (child.CompareTag("RightHandTarget"))
                {
                    handRig.rightHandTarget = child.GetChild(0);
                }
            }
            handRig.SetIKHandPosition();
        }

        bulletCasingVFX = Instantiate(Resources.Load<GameObject>("Prefabs/VFX/GunFX-BulletCasing-1"), magHand.parent);
        ParticleSystem.MainModule bcMain = bulletCasingVFX.GetComponent<ParticleSystem>().main;
        bcMain.customSimulationSpace = transform.root.GetChild(0);

        //Tweener setup    
        fireTween = transform.parent.DOLocalMoveY(0.175f, shootSpeed / 2).OnPlay(SetupFireTween);
        fireTween.SetLoops(2, LoopType.Yoyo);
        fireTween.SetLoops(2, LoopType.Yoyo);
        fireTween.SetEase(Ease.InCirc);
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

        magTween = magHand.parent.DOLocalMoveY(-0.2f, reloadTime);
        magTween.SetAutoKill(false);
        magTween.SetRelative(true);
        magTween.SetDelay(reloadTime);
        magTween.SetLoops(2, LoopType.Yoyo);
        magTween.Pause();

        transform.parent.localEulerAngles = new Vector3(0, 0, 90);
        //pullOutTween = transform.parent.DOLocalMoveX(0.5f, 0.85f).From();
        pullOutTween =transform.parent.DOLocalRotate(new Vector3(0, 0, 180), 0.85f).From();
        //pullOutTween.SetRelative(true)

        enabled = true;
    }

    private void SetupwalkBounceTween() {
        walkBounceTween = transform.parent.DOLocalMoveX(0.1f, 0.3f).SetEase(Ease.InCirc);
    }
    private void SetupFireTween() {
        subtleRockTween = transform.DOLocalRotate
            (new Vector3(Random.Range(-randomSubtleRockAmount, randomSubtleRockAmount), 0, 0), shootSpeed /2, RotateMode.Fast);
        subtleRockTween.SetLoops(2, LoopType.Yoyo);
        subtleRockTween.Rewind();
        subtleRockTween.PlayForward();
    }
    private void RandomizeSubtleRockTween() {
        subtleRockTween.Rewind();
        randomSubtleRockAmount = Random.Range(-randomSubtleRockAmount, randomSubtleRockAmount);
    }
    private void RestartFireTween() {
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

    private void Start() {
        bulletsLeft = magazineSize;
        readyToShoot = true;
    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        //LEFT CLICK (FIRE)
        if(context.action.name == TagManager.USE_ACTION) {
            if (context.started) {
                autoFire = true;
            }
        }

        //RIGHT CLICK (ADS)
        if(context.action.name == TagManager.USE2_ACTION) {
            if(pir.IsSprintingPressed() == false)
                ADS();
        }

        //R RELOAD
        if(context.action.name == TagManager.RELOAD_ACTION) {
            if(!reloading)
                Reload();
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) {
        if(context.action.name == TagManager.USE_ACTION) {
            autoFire = false;
        }      
    }


    private void Update() {
        //Autofire
        if(autoFire && Time.time > nextFire && !sprinting) {
            Shoot();
            nextFire = Time.time + shootSpeed;
        }

        //Set ammo display, if it exists
        if (ammunitionDisplay != null)
            ammunitionDisplay.SetText(bulletsLeft + " / " + magazineSize);

        if(pir.GetHorizontalMovementInput() > 0 || pir.GetVerticalMovementInput() > 0) {
            walkBounceTween.Play();

            //Sprinting
            if (pir.IsSprintingPressed()) {
                sprintTween.PlayForward();
                sprinting = true;

                if (ads)
                    ADS();
            } else if (sprintTween.IsComplete() || sprintTween.IsPlaying()) {
                sprintTween.PlayBackwards();
                sprinting = false;
            }
        }
    }

    private void Shoot() {
        // Don't shoot if no bullets left
        if (bulletsLeft <= 0) {
            GameObject dryFireSFX = gunFXPool.GetEmptyFireSound();
            dryFireSFX.SetActive(true);
            return;
        }

        bulletCasingVFX.GetComponent<ParticleSystem>().Play();

        bulletsLeft--;

        fireTween.PlayForward();

        //MuzzleFlash
        GameObject muzzleFlash = gunFXPool.GetMuzzleFlash();
        muzzleFlash.transform.position = muzzleTarget.position;
        muzzleFlash.transform.rotation = muzzleTarget.rotation;
        muzzleFlash.transform.parent = muzzleTarget;
        muzzleFlash.SetActive(true);

        //Find the exact hit position using a raycast
        Ray ray = fpsCam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        RaycastHit hit;
        Vector3 targetPoint;
        if (Physics.Raycast(ray, out hit)) {
            targetPoint = hit.point;
            Damageable objectHit = hit.transform.gameObject.GetComponent<Damageable>();

            if (objectHit != null) {
                // Shot hit a damageable object
                Damageable.DamageMessage damageMessage = new Damageable.DamageMessage();
                damageMessage.amount = 1;
                objectHit.ApplyDamage(damageMessage);
            }
        } else {
            targetPoint = ray.GetPoint(75); //Just a point far away from the player
        }

        //Calculate direction from attackPoint to targetPoint
        Vector3 directionWithoutSpread = targetPoint - attackPoint.position;

        //Calculate spread
        float x = Random.Range(-spread, spread);
        float y = Random.Range(-spread, spread);

        //Calculate new direction with spread
        Vector3 directionWithSpread = directionWithoutSpread + new Vector3(x, y, 0); //Just add spread to last direction


        // Shot Audio
        GameObject gunShotAudio = gunFXPool.GetShotSound();
        gunShotAudio.transform.position = muzzleTarget.position;
        gunShotAudio.SetActive(true);

        GameObject impactFX = gunFXPool.GetImpact();
        impactFX.transform.position = targetPoint;
        impactFX.SetActive(true);

        GameObject surfaceImpactFX = gunFXPool.GetSurfaceImpactFX(targetPoint, Vector3.forward);
        surfaceImpactFX.SetActive(true);
    }

    private void ADS() {
        if (!ads) {
            ads = true;
            adsTween.PlayForward();
            fpsCam.DOFieldOfView(zoomFOV, .5f);
            playerCam.DOFieldOfView(equippedZoomFOV, .25f);
            skyboxCam.DOFieldOfView(zoomFOV, .5f);
            transform.parent.parent.GetComponent<UnityEngine.Animations.PositionConstraint>().weight = .9f;
        } else {
            ads = false;
            adsTween.PlayBackwards();
            fpsCam.DOFieldOfView(startingFOV, .25f);
            skyboxCam.DOFieldOfView(startingFOV, .35f);
            playerCam.DOFieldOfView(startingEquippedFOV, .25f);
            transform.parent.parent.GetComponent<UnityEngine.Animations.PositionConstraint>().weight = .1f;
        }
    }

    private void Reload() {
        reloading = true;

        this.transform.parent.GetComponent<AudioSource>().Stop();
        this.transform.parent.GetComponent<AudioSource>().Play();
        defaultHand = handRig.leftHandTarget;
        DOTween.To(()
            => handRig.posIK.solver.leftHandEffector.positionWeight,
            x => handRig.posIK.solver.leftHandEffector.positionWeight = x,
            .85f,
            reloadTime * .25f);
        DOTween.To(()
            => handRig.posIK.solver.leftHandEffector.rotationWeight,
            x => handRig.posIK.solver.leftHandEffector.rotationWeight = x,
            .85f,
            reloadTime * .25f);
        handRig.leftHandPoser.poseRoot = magHand;
        handRig.leftHandPoser.weight = 0;
        handRig.leftHandTarget = magHand;
        handRig.SetIKHandPosition();
        DOTween.To(()
            => handRig.leftHandPoser.weight,
            x => handRig.leftHandPoser.weight = x,
            1,
            reloadTime * .75f);
        magTween.Rewind();
        magTween.PlayForward();

        Invoke("ReloadFinished", reloadTime * 3); //Invoke ReloadFinished function with your reloadTime as delay
    }
    private void ReloadFinished() {
        bulletsLeft = magazineSize;
        handRig.leftHandTarget = defaultHand;
        handRig.leftHandPoser.poseRoot = defaultHand;
        handRig.SetIKHandPosition();
        reloading = false;
    }

    private void OnDisable() {
        pullOutTween.Kill();
        //if (ads)
        //{
        //    ADS();
        //}
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
    //    GameObject bulletCasingVFX = Instantiate(bullet, attackPoint.position, Quaternion.identity); //store instantiated bullet in bulletCasingVFX
    //    //Rotate bullet to shoot direction
    //    bulletCasingVFX.transform.forward = directionWithSpread.normalized;

    //    //Add forces to bullet
    //    bulletCasingVFX.GetComponent<Rigidbody>().AddForce(directionWithSpread.normalized * shootForce, ForceMode.Impulse);
    //    bulletCasingVFX.GetComponent<Rigidbody>().AddForce(fpsCam.transform.up * upwardForce, ForceMode.Impulse);

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
}
