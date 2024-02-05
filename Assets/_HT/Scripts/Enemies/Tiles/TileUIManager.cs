using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class TileUIManager : MonoBehaviour
{
    public GameObject tileCanvas, progressBar;
    public Image progress;
    public TextMeshProUGUI inProgressText;

    public void EnterTile() {
        tileCanvas.SetActive(true);
        inProgressText.gameObject.SetActive(true);
    }

    public void ExitTile() {
        tileCanvas.SetActive(false);
        inProgressText.gameObject.SetActive(false);
    }

    public void SetProgressBar(float percentComplete) {
        progress.fillAmount = percentComplete;
        inProgressText.text = Mathf.RoundToInt(percentComplete * 100).ToString("F0") + "%";

        if (percentComplete == 1f) {
            ClaimTile();
        }
    }

    private void ClaimTile() {
        inProgressText.text = "Tile Claimed!";
        progressBar.SetActive(false);
    }
}
