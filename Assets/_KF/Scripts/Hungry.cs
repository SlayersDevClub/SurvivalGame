using System.Collections;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class Hungry : MonoBehaviour {

    public int currentHunger { get; private set; }
    public int maxHunger;

    public int tickDownAmount;
    public int tickDownSpeed;

    public Image hungerBar;

    public UnityEvent OnRaiseHunger, OnReduceHunger, OnStarving;

    private void Start() {
        currentHunger = maxHunger;

        if (hungerBar != null) {
            hungerBar.fillAmount = 1;
        }

        StartCoroutine(TickDownHunger());
    }

    public void RaiseHunger(int hungerGain) {
        if (currentHunger == maxHunger) {
            Debug.Log("Hunger already at max.");
            return;
        }

        if (currentHunger + hungerGain > maxHunger) {
            currentHunger = maxHunger;
        } else {
            currentHunger += hungerGain;
        }

        if (hungerBar != null) {
            hungerBar.fillAmount = (float)currentHunger / maxHunger;
        }

        OnRaiseHunger.Invoke();
    }

    public void ReduceHunger(int hungerLoss) {
        if (currentHunger == 0) {
            Debug.Log("Hunger already at 0.");
            return;
        }

        if (currentHunger - hungerLoss < 0) {
            currentHunger = 0;
            OnStarving.Invoke();
        } else {
            currentHunger -= hungerLoss;
        }

        if (hungerBar != null) {
            hungerBar.fillAmount = (float)currentHunger/maxHunger;
        }

        OnReduceHunger.Invoke();
    }

    private IEnumerator TickDownHunger() {
        while (currentHunger > 0) {
            ReduceHunger(tickDownAmount);
            yield return new WaitForSeconds(tickDownSpeed);
        }

        yield return null;
    }
}
