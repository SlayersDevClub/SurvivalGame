using UnityEngine;

public static class PlayerManager {

    public static int equipSlot = 0;
    public static BaseItemTemplate equipItem = null;

    public static Transform GetPlayerTransform() {
        return GameObject.Find(TagManager.PLAYER_BODY).transform;
    }
}
