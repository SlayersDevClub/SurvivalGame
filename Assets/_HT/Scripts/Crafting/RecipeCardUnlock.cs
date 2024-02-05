using UnityEngine.UI;
using UnityEngine;
using UnityEngine.EventSystems;

public class RecipeCardUnlock : MonoBehaviour, IPointerClickHandler {
    public GameObjectBoolRuntimeDict recipesUnlocked;

    private void OnEnable() {
        recipesUnlocked.Add(gameObject, false);
    }

    public void OnPointerClick(PointerEventData eventData) {
        Debug.Log("CLICKED CARD");
        recipesUnlocked.Add(gameObject, true);
    }

}
