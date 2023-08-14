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
        inventoryGrid,
        optionsMenu,
        gunCrafterGrid,
        toolCrafterGrid,
        chestGrid,
        generalCraftGrid;

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
            if (optionsMenu.gameObject.activeSelf)
            {
                HideOptionsMenu();
            }
        }

    }

    void ShowOptions()
    {
        optionsMenu.gameObject.SetActive(true);

    }

    void HideOptions()
    {
        optionsMenu.gameObject.SetActive(false);
    }

    public void ShowControllerCursor(bool b)
    {
        if (b) controllerUICursor.SetActive(true);
        else controllerUICursor.SetActive(false);
    }

    public void ShowGunCrafterPanel(bool b)
    {
        if (b)
        {
            gunCrafterGrid.DOFade(1, 1);
        }
        else
        {
            gunCrafterGrid.DOFade(0, 1);
        }
    }

    public void ShowToolCraftingPanel(bool b)
    {
        if (b)
        {
            toolCrafterGrid.DOFade(1, 1);
        } else
        {
            toolCrafterGrid.DOFade(0, 1);
        }
    }

    public void ShowGeneralCraftingPanel(bool b)
    {
        if (b)
        {
            generalCraftGrid.DOFade(1, 1);
        }
        else
        {
            generalCraftGrid.DOFade(0, 1);
        }
    }

    public void ShowChestPanel(bool b)
    {
        if (b)
        {
            chestGrid.DOFade(1, 1);
        }
        else
        {
            chestGrid.DOFade(0, 1);
        }
    }
    public void Pause()
    {
        //optionsMenu.SetActive(true);
    }

    public void UnPause() {
        //PlayerStateMachine player = transform.parent.GetComponent<PlayerStateMachine>();
        //player.SwitchState(player.MovingState);
    }

    public void ShowOptionsMenu()
    {
        optionsMenu.DOKill();
        optionsMenu.DOFade(1, 1).OnStart(ShowOptions); ;
    }

    public void HideOptionsMenu()
    {
        optionsMenu.DOKill();
        optionsMenu.DOFade(0, 1).OnComplete(HideOptions); ;
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
