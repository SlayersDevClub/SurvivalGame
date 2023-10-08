using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewBodyTemplate", menuName = "Game/Body Template")]
public class BodyTemplate : BaseItemTemplate {
    public int damage;
    public bool allowButtonHold;
}
