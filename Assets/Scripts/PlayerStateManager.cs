using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum PlayerControlState { Moving, Paused, Interacting };

public class PlayerStateManager : MonoBehaviour
{
    private PlayerControlState _playerControlState;
    public PlayerControlState playerControlState { get { return _playerControlState; } set { _playerControlState = value; } }
    PlayerInputReader pir;

    void Start()
    {
        pir = GetComponent<PlayerInputReader>();
        ChangePlayerState(PlayerControlState.Moving);
    }

    public void ChangePlayerState(PlayerControlState pState)
    {
        if (pState == PlayerControlState.Moving)
        {
            pir.playerInput.SwitchCurrentActionMap("Move");
            transform.Find("PlayerUI").GetComponent<UIManager>().ShowPlayerInventory(false);
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
            print("moving");

            if (pir.playerInput.currentControlScheme == "Gamepad")
            {
                transform.Find("PlayerUI").GetComponent<UIManager>().ShowControllerCursor(false);
            }
        }

        if (pState == PlayerControlState.Paused)
        {
            pir.playerInput.SwitchCurrentActionMap("UI");
            transform.Find("PlayerUI").GetComponent<UIManager>().ShowPlayerInventory(true);
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            print("paused");

            if (pir.playerInput.currentControlScheme == "Gamepad")
            {
                transform.Find("PlayerUI").GetComponent<UIManager>().ShowControllerCursor(true);
            }
        }

        if(pState == PlayerControlState.Interacting)
        {
            pir.playerInput.SwitchCurrentActionMap("UI");
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            print("interacting");

            if (pir.playerInput.currentControlScheme == "Gamepad")
            {
                transform.Find("PlayerUI").GetComponent<UIManager>().ShowControllerCursor(true);
            }
        }
    }

    //Use this for UI buttons and unity events to change state if needed. It's currently only being used on the Resume button in the Pause Menu.
    public void GetNewState(ChangePlayerStateOverride s)
    {
        ChangePlayerState(s.newState);
    }
}
