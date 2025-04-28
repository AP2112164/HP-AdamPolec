using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playWalk : MonoBehaviour
{
    AudioSource walk;
    // Start is called before the first frame update
    void Start()
    {
        walk = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void playSound()
    {
        walk.pitch = UnityEngine.Random.Range(1f, 1.4f);
        walk.Play();
    }
}
