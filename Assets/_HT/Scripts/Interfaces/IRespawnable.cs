using UnityEngine;

public interface IRespawnable {
    float respawnTime { get; set; }
    Vector3 respawnPosition { get; set; }
    Quaternion respawnRotation { get; set; }

    void StartRespawn();
}
