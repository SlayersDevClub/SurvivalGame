using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public GameObject controllerUICursor;
    public GameObject
        gameSettingsWindow,
        controlWindow,
        saveLoadWindow,
        graphicsWindow,
        statsWindow;

    public GameObject
        pauseMenu;

    private void OnEnable()
    {
        ShowStatsWindow();
    }

    public void ShowControllerCursor(bool b)
    {
        if (b) controllerUICursor.SetActive(true);
        else controllerUICursor.SetActive(false);
    }

    public void ShowPauseMenu(bool b)
    {
        if (b)
        {
            pauseMenu.SetActive(true);
        }
        else
        {
            pauseMenu.SetActive(false);
        }
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
