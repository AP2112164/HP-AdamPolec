using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "DialogueAudioInfo", menuName = "ScriptableObjects/DialogueAudioInfoSO", order = 1)]
public class dialogAudioInfoSO : ScriptableObject
{
    public string id;
    public AudioClip[] dialogTypeSndClips;
    [Range(1, 10)]
    public int frequencyLvl = 3;
    [Range(-2, 2)]
    public float minPitch = 0.5f;
    [Range(-2, 2)]
    public float maxPitch = 1.4f;
    public bool stopAudio;
}
