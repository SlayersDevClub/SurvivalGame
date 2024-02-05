using UnityEngine;
using UnityEngine.EventSystems;

public class UIRaycastHitTester : MonoBehaviour {
    // Update is called once per frame
    void Update() {
        // Check if the left mouse button is clicked
        if (Input.GetMouseButtonDown(0)) {
            // Check if the pointer is over a UI element
            if (EventSystem.current.IsPointerOverGameObject()) {
                // Get the pointer data
                PointerEventData pointerData = new PointerEventData(EventSystem.current);
                pointerData.position = Input.mousePosition;

                // Raycast to find the UI object
                EventSystem.current.RaycastAll(pointerData, null);

                // Check if any UI object is hit
                if (pointerData.pointerCurrentRaycast.isValid) {
                    // Get the name of the UI object
                    string uiObjectName = pointerData.pointerCurrentRaycast.gameObject.name;

                    // Print the name of the UI object
                    Debug.Log("UI Object Clicked: " + uiObjectName);
                }
            }
        }
    }
}
