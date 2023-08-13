using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class UIManager : MonoBehaviour
{
    public GameObject controllerUICursor;
    public GameObject
        gameSettingsWindow,
        controlWindow,
        saveLoadWindow,
        graphicsWindow,
        statsWindow;
    public CanvasGroup
        inventoryGrid;

    public GameObject
        pauseMenu;



    public void ShowPlayerInventory(bool b)
    {
        if (b)
        {
            inventoryGrid.DOKill();
            inventoryGrid.DOFade(1, 1);
        } else
        {
            inventoryGrid.DOKill();
            inventoryGrid.DOFade(0, 1);

            //Incase the pause menu is ON, turn it off.
            if (pauseMenu.activeSelf)
            {
                UnPause();
            }
        }

    }

    public void ShowControllerCursor(bool b)
    {
        if (b) controllerUICursor.SetActive(true);
        else controllerUICursor.SetActive(false);
    }

    public void Pause()
    {
        pauseMenu.SetActive(true);
    }

    public void UnPause() {
        PlayerStateMachine player = transform.parent.GetComponent<PlayerStateMachine>();
        player.SwitchState(player.MovingState);
        pauseMenu.SetActive(false);
    }
    public void ShowStatsWindow()
    {
        ShowWindow(statsWindow);
    }
    public void ShowGraphicsWindow()
    {
        ShowWindow(graphicsWindow);
    }

    public void ShowGameSettingsWindow()
    {
        ShowWindow(gameSettingsWindow);
    }

    public void ShowControlWindow()
    {
        ShowWindow(controlWindow);
    }

    public void ShowSaveLoadWindow()
    {
        ShowWindow(saveLoadWindow);
    }

    void ShowWindow(GameObject window)
    {
        gameSettingsWindow.SetActive(false);
        controlWindow.SetActive(false);
        saveLoadWindow.SetActive(false);
        graphicsWindow.SetActive(false);
        statsWindow.SetActive(false);

        window.SetActive(true);
    }


}
