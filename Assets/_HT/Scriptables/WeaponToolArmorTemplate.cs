using UnityEngine;

[CreateAssetMenu(fileName = "NewPummelTemplate", menuName = "Game/Pummel Template")]
public class PummelTemplate : BaseItemTemplate {
    public int damage;

}

[CreateAssetMenu(fileName = "NewGunTemplate", menuName = "Game/Gun Template")]
public class GunTemplate : BaseItemTemplate {
    public int ammoCapacity;
    public float fireRate;
    public float reloadTime;
}

[CreateAssetMenu(fileName = "NewSightTemplate", menuName = "Game/Sight Template")]
public class SightTemplate : BaseItemTemplate {
    public float zoomLevel;
}

[CreateAssetMenu(fileName = "NewGripTemplate", menuName = "Game/Grip Template")]
public class GripTemplate : BaseItemTemplate {
    public float recoilReduction;
}

[CreateAssetMenu(fileName = "NewBodyTemplate", menuName = "Game/Body Template")]
public class BodyTemplate : BaseItemTemplate {
    public float weight;
}

[CreateAssetMenu(fileName = "NewBarrelTemplate", menuName = "Game/Barrel Template")]
public class BarrelTemplate : BaseItemTemplate {
    public float bulletVelocity;
}

[CreateAssetMenu(fileName = "NewMagTemplate", menuName = "Game/Mag Template")]
public class MagTemplate : BaseItemTemplate {
    public int ammoCount;
}

[CreateAssetMenu(fileName = "NewStockTemplate", menuName = "Game/Stock Template")]
public class StockTemplate : BaseItemTemplate {
    public float stability;
}

// Sword Scriptable Object Classes
[CreateAssetMenu(fileName = "NewSwordGripTemplate", menuName = "Game/Sword Grip Template")]
public class SwordGripTemplate : BaseItemTemplate {
    public float handling;
}

[CreateAssetMenu(fileName = "NewSwordCrossguardTemplate", menuName = "Game/CrossguardTemplate")]
public class CrossguardTemplate : BaseItemTemplate {
    public float handling;
}

[CreateAssetMenu(fileName = "NewBladeTemplate", menuName = "Game/Blade Template")]
public class BladeTemplate : BaseItemTemplate {
    public int damage;
}

[CreateAssetMenu(fileName = "NewEnchantmentTemplate", menuName = "Game/Enchantment Template")]
public class EnchantmentTemplate : BaseItemTemplate {
    public string specialEffect;
}

// Axe Scriptable Object Classes
[CreateAssetMenu(fileName = "NewAxeHandleTemplate", menuName = "Game/Axe Handle Template")]
public class AxeHandleTemplate : BaseItemTemplate {
    public float swingSpeed;
}

[CreateAssetMenu(fileName = "NewAxeBladeTemplate", menuName = "Game/Axe Blade Template")]
public class AxeBladeTemplate : BaseItemTemplate {
    public int damage;
}

// Hammer Scriptable Object Classes
[CreateAssetMenu(fileName = "NewHammerHandleTemplate", menuName = "Game/Hammer Handle Template")]
public class HammerHandleTemplate : BaseItemTemplate {
    public float swingSpeed;
}

[CreateAssetMenu(fileName = "NewHammerHeadTemplate", menuName = "Game/Hammer Head Template")]
public class HammerHeadTemplate : BaseItemTemplate {
    public int damage;
}

// Pickaxe Scriptable Object Classes
[CreateAssetMenu(fileName = "NewPickaxeHandleTemplate", menuName = "Game/Pickaxe Handle Template")]
public class PickaxeHandleTemplate : BaseItemTemplate {
    public float swingSpeed;
}

[CreateAssetMenu(fileName = "NewPickaxePickTemplate", menuName = "Game/Pickaxe Pick Template")]
public class PickaxePickTemplate : BaseItemTemplate {
    public int damage;
}

