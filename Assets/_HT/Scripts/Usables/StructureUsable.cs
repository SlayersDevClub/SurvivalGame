using UnityEngine;
using UnityEngine.InputSystem;

public class StructureUsable : MonoBehaviour, IUsable {
    public SnapGridCenter snapGridCenter;

    private bool allowMovement = true; // Flag to control movement
    bool validSpot = false;
    bool placedDown = false;

    int structureLayer;
    private void Start() {
        structureLayer = LayerMask.NameToLayer(TagManager.STRUCTURE_LAYER);
    }

    // Function to recursively set the layer of an object and its children
    private void SetLayerRecursively(GameObject obj, int newLayer) {
        obj.layer = newLayer;
        foreach (Transform child in obj.transform) {
            SetLayerRecursively(child.gameObject, newLayer);
        }
    }

    public void HandleInput(InputAction.CallbackContext context) {
        // LEFT CLICK
        if (context.started) {
            if (context.action.name == TagManager.USE_ACTION) {
                allowMovement = !allowMovement; // Toggle the movement flag
            } else if (context.action.name == TagManager.ROTATE_ACTION) {
                Debug.Log(context.ReadValue<float>());
                snapGridCenter.Rotater(gameObject, context.ReadValue<float>());
            }
        }
    }


    private void Update() {
        if (!placedDown) {
            if (allowMovement) {
                validSpot = snapGridCenter.Mover(gameObject);
                /*
                if (validSpot) {
                    SetLayerRecursively(gameObject, placeableLayer);
                } else if(gameObject.layer != doNotRenderLayer) {
                    SetLayerRecursively(gameObject, notPlaceableLayer);
                }*/
                snapGridCenter.Rotater(gameObject, Mouse.current.scroll.ReadValue().normalized.y);
            } else {
                if (validSpot) {
                    Debug.Log("GRAY");
                    PlayerStateMachine player = transform.root.GetComponent<PlayerStateMachine>();
                    gameObject.transform.parent = null;
                    SetLayerRecursively(gameObject, structureLayer);
                    //player.inv.RemoveItem(player.equipItemSlot);
                    placedDown = true;
                    validSpot = false;
                } else {
                    allowMovement = true;
                }
            }
        }
    }
}
