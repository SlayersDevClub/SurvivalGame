using UnityEngine;
using System.Collections;

[CreateAssetMenu(menuName = "Events/SimpleAudioEvent")]

public class SimpleAudioEvent : AudioEvent {
    public AudioClip clip;

    public override void Play(AudioSource source) {
        if(clip != null) {
            source.clip = clip;
            source.Play();
            Debug.Log("Playing");
        }
    }
}