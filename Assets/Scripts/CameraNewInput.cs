using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using CMF;

public class CameraNewInput : CameraInput
{
    public PlayerInput playerInput;
    public bool invertHorizontalInput, invertVerticalInput;
    InputAction look;

    float lookInputSpeed = 0.001f;

    void Awake()
    {
        playerInput = transform.parent.parent.GetComponent<PlayerInput>();
        look = playerInput.actions["Look"];
        CheckForControlChange(playerInput);
    }

    public void UpdateSettings()
    {
        CheckForControlChange(playerInput);
    }

    public void CheckForControlChange(PlayerInput pi)
    {
        if (pi.currentControlScheme == "Gamepad")
        {
            lookInputSpeed = PlayerPrefs.GetFloat("GamepadLookSensitivity") * 0.001f;
            //invertHorizontalInput = PlayerPrefs.GetInt("InvertHorizontalLook");
        }

        if (pi.currentControlScheme == "MouseKeyboard")
        {
            lookInputSpeed = PlayerPrefs.GetFloat("MouseLookSensitivity") * 0.0005f;
        }
    }

    public override float GetHorizontalCameraInput()
    {
        //Get raw mouse input;
        float _input = look.ReadValue<Vector2>().x;

        //Since raw mouse input is already time-based, we need to correct for this before passing the input to the camera controller;
        if (Time.timeScale > 0f && Time.deltaTime > 0f)
        {
            _input /= Time.deltaTime;
            _input *= Time.timeScale;
        }
        else
            _input = 0f;

        //Apply mouse sensitivity;
        _input *= lookInputSpeed;

        //Invert input;
        if (invertHorizontalInput)
            _input *= -1f;

        return _input;
    }

    public override float GetVerticalCameraInput()
    {
        //Get raw mouse input;
        float _input = -look.ReadValue<Vector2>().y;

        //Since raw mouse input is already time-based, we need to correct for this before passing the input to the camera controller;
        if (Time.timeScale > 0f && Time.deltaTime > 0f)
        {
            _input /= Time.deltaTime;
            _input *= Time.timeScale;
        }
        else
            _input = 0f;

        //Apply mouse sensitivity;
        _input *= lookInputSpeed;

        //Invert input;
        if (invertVerticalInput)
            _input *= -1f;

        return _input;
    }
}
