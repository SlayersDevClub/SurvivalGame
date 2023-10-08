using UnityEngine;
using DG.Tweening;

/*
 * Manages UI elements and controls their visibility.
 */
public class UIManager : MonoBehaviour {
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

    private void Start() {
        Invoke("DelayTurnOffInventories", 0.5f);
    }
    
    /*
     * Turns off all the different types of inventory UIs
     */
    void DelayTurnOffInventories() {
        TurnOffGunCrafter();
        TurnOffChest();
        TurnOffToolCrafting();
        TurnOffCrafting();
    }

    /*
     * Turns the player's inventory on or off.
     * True = on, false = off
     */
    public void ShowPlayerInventory(bool b) {
        if (b) {
            inventoryGrid.DOKill();
            inventoryGrid.DOFade(1, 1);
        } else {
            inventoryGrid.DOKill();
            inventoryGrid.DOFade(0, 1);

            //Incase the pause menu is ON, turn it off.
            if (optionsMenu.gameObject.activeSelf) {
                HideOptionsMenu();
            }
        }
    }

    /*
     * Turns the gun crafting panel on or off.
     * True = on, false = off
     */
    public void ShowGunCrafterPanel(bool b) {
        if (b) {
            gunCrafterGrid.DOFade(1, 1).OnStart(TurnOnGunCrafter);
        } else {
            gunCrafterGrid.DOFade(0, 1).OnComplete(TurnOffGunCrafter);
        }
    }

    void TurnOnGunCrafter() {
        gunCrafterGrid.gameObject.SetActive(true);
    }
    void TurnOffGunCrafter() {
        gunCrafterGrid.gameObject.SetActive(false);
    }

    /*
     * Turns the tool crafting panel on or off.
     * True = on, false = off
     */
    public void ShowToolCraftingPanel(bool b) {
        if (b) {
            toolCrafterGrid.DOFade(1, 1).OnStart(TurnOnToolCrafting);
        } else {
            toolCrafterGrid.DOFade(0, 1).OnComplete(TurnOffToolCrafting);
        }
    }

    void TurnOnToolCrafting() {
        toolCrafterGrid.gameObject.SetActive(true);
    }
    void TurnOffToolCrafting() {
        toolCrafterGrid.gameObject.SetActive(false);
    }

    /*
     * Turns the generic crafting panel on or off.
     * True = on, false = off
     */
    public void ShowGeneralCraftingPanel(bool b) {
        if (b) {
            generalCraftGrid.DOFade(1, 1).OnStart(TurnOnCrafting);
        } else {
            generalCraftGrid.DOFade(0, 1).OnComplete(TurnOffCrafting);
        }
    }

    void TurnOnCrafting() {
        generalCraftGrid.gameObject.SetActive(true);
    }
    void TurnOffCrafting() {
        generalCraftGrid.gameObject.SetActive(false);
    }

    /*
     * Turns the chest panel on or off.
     * True = on, false = off
     */
    public void ShowChestPanel(bool b) {
        if (b) {
            chestGrid.DOFade(1, 1).OnStart(TurnOnChest);
        } else {
            chestGrid.DOFade(0, 1).OnComplete(TurnOffChest);
        }
    }

    void TurnOnChest() {
        chestGrid.gameObject.SetActive(true);
    }
    void TurnOffChest() {
        chestGrid.gameObject.SetActive(false);
    }

    /*
     * Turns the controller cursor on or off.
     * True = on, false = off
     */
    public void ShowControllerCursor(bool b) {
        if (b)
            controllerUICursor.SetActive(true);
        else
            controllerUICursor.SetActive(false);
    }

    public void Pause() {
        //optionsMenu.SetActive(true);
    }

    public void UnPause() {
        //PlayerStateMachine player = transform.parent.GetComponent<PlayerStateMachine>();
        //player.SwitchState(player.MovingState);
    }

    public void ShowOptionsMenu() {
        optionsMenu.DOKill();
        optionsMenu.DOFade(1, 1).OnStart(ShowOptions); ;
    }

    public void HideOptionsMenu() {
        optionsMenu.DOKill();
        optionsMenu.DOFade(0, 1).OnComplete(HideOptions); ;
    }

    void ShowOptions() {
        optionsMenu.gameObject.SetActive(true);
    }

    void HideOptions() {
        optionsMenu.gameObject.SetActive(false);
    }

    public void ShowStatsWindow() {
        ShowWindow(statsWindow);
    }
    public void ShowGraphicsWindow() {
        ShowWindow(graphicsWindow);
    }

    public void ShowGameSettingsWindow() {
        ShowWindow(gameSettingsWindow);
    }

    public void ShowControlWindow() {
        ShowWindow(controlWindow);
    }

    public void ShowSaveLoadWindow() {
        ShowWindow(saveLoadWindow);
    }

    void ShowWindow(GameObject window) {
        gameSettingsWindow.SetActive(false);
        controlWindow.SetActive(false);
        saveLoadWindow.SetActive(false);
        graphicsWindow.SetActive(false);
        statsWindow.SetActive(false);

        window.SetActive(true);
    }

}
