using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovePlayer : MonoBehaviour
{
    public float movSpeed; // set to 2 in Unity
    float speedX, speedY;
    private Vector2 input;
    Rigidbody2D rb;
    Animator miloMove;
    AudioSource asound;
    private bool moving;

    //SpriteRenderer sprRen;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        //sprRen = GetComponent<SpriteRenderer>();
        miloMove = GetComponent<Animator>();
        asound = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        if (dialogManager.GetInstance().dialogueIsPlaying)
        {
            return;
        }
        GetInput();
        Animate();
        //sprRen.flipX = rb.velocity.x < 0f;//character flips when moving to different direction

        // if(Input.GetKeyDown("i")){
        //     Debug.Log("pressed");
        // }

    }

    private void FixedUpdate()
    {
        rb.velocity = input;
    }

    private void GetInput()
    {
        speedX = Input.GetAxisRaw("Horizontal") * movSpeed;
        speedY = Input.GetAxisRaw("Vertical") * movSpeed;

        input = new Vector2(speedX, speedY);
        input.Normalize();
        //asound.Play();
    }

    private void Animate()
    {
        if (input.magnitude > 0.1f || input.magnitude < -0.1f)
        {
            moving = true;
        } 
        else
        {
            moving = false;
        }

        if (moving) {
            //asound.Play();
            miloMove.SetFloat("X", speedX);
            miloMove.SetFloat("Y", speedY);
        }

        miloMove.SetBool("Moving", moving);
    }

    public void playSound()
    {
        asound.pitch = UnityEngine.Random.Range(1f, 1.4f);
        asound.Play();
    }
}
