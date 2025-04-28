using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

[RequireComponent(typeof(PlayerInput))]
public class InputManager : MonoBehaviour
{
    private bool interactPressed = false;
    private bool submitPressed = false;
    private bool helpPressed = false;
    private static InputManager instance;

    private void Awake()
    {
        if(instance != null){
            Debug.LogError("There can only be one Input manager in a scene.");
        }
        instance = this;
    }

    public static InputManager GetInstance(){
        return instance;
    }

    public void InteractButtonPressed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            interactPressed = true;
        }
        else if (context.canceled)
        {
            interactPressed = false;
        }
    }

    public void SubmitButtonPressed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            submitPressed = true;
        }
        else if (context.canceled)
        {
            submitPressed = false;
        }
    }

    public void HelpButtonPressed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            helpPressed = true;
        }
        else if (context.canceled)
        {
            helpPressed = false;
        }
    }

    public bool GetInteractPressed(){
        bool result = interactPressed;
        interactPressed = false;
        return result;
    }

    public bool GetSubmitPressed(){
        bool result = submitPressed;
        submitPressed = false;
        return result;
    }

    public bool GetHelpPressed() { 
        bool result = helpPressed;
        helpPressed = false;    
        return result; 
    }
}
