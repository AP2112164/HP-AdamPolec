using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class dialogTrigger : MonoBehaviour
{
    [Header("Visual Cue")]
    [SerializeField] private GameObject visualCue;

    [Header("Ink JSon")]
    [SerializeField] private TextAsset inkJSON;

    private bool playerInRange;
    AudioSource soundVis;

    private void Update(){
        if(playerInRange && !dialogManager.GetInstance().dialogueIsPlaying){
            visualCue.SetActive(true);
            
            if (InputManager.GetInstance().GetInteractPressed()){
                //Debug.Log(inkJSON.text);
                dialogManager.GetInstance().EnterDialogueMode(inkJSON);
            }
        } else {
            visualCue.SetActive(false);
        }
    }

    private void Awake(){
        playerInRange = false;
        visualCue.SetActive(false);
        soundVis = GetComponent<AudioSource>();
    }

    private void OnTriggerEnter2D(Collider2D collider)
    {
        if(collider.gameObject.tag == "Player"){
            playerInRange = true;
            soundVis.Play();
        }
    }
    private void OnTriggerExit2D(Collider2D collider)
    {
        if(collider.gameObject.tag == "Player"){
            playerInRange = false;
            soundVis.Stop();
        }
    }
}
