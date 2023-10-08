using UnityEngine;
using UnityEngine.InputSystem;

public class StructureUsable : MonoBehaviour, IUsable {
    private bool allowMovement = true; // Flag to control movement
    bool validSpot = false;
    bool placedDown = false;
    int placeableLayer, notPlaceableLayer, structureLayer, doNotRenderLayer;

    private void Start() {
        placeableLayer = LayerMask.NameToLayer(TagManager.PLACEABLE_LAYER);
        notPlaceableLayer = LayerMask.NameToLayer(TagManager.NOTPLACEABLE_LAYER);
        structureLayer = LayerMask.NameToLayer(TagManager.STRUCTURE_LAYER);
        doNotRenderLayer = LayerMask.NameToLayer(TagManager.DONOTRENDER); ;
    }

    // Function to recursively set the layer of an object and its children
    private void SetLayerRecursively(GameObject obj, int newLayer) {
        obj.layer = newLayer;
        foreach (Transform child in obj.transform) {
            SetLayerRecursively(child.gameObject, newLayer);
        }
    }

    public void StartHandleInput(InputAction.CallbackContext context) {
        // LEFT CLICK
        if (context.started) {
            if (context.action.name == TagManager.USE_ACTION) {
                allowMovement = !allowMovement; // Toggle the movement flag
            } else if (context.action.name == TagManager.ROTATE_ACTION) {
                Debug.Log(context.ReadValue<float>());
                SnapGridCenter.instance.Rotater(gameObject, context.ReadValue<float>());
            }
        }
    }

    public void EndHandleInput(InputAction.CallbackContext context) {

    }

    private void Update() {
        if (!placedDown) {
            if (allowMovement) {
                validSpot = SnapGridCenter.instance.Mover(gameObject);
                /*
                if (validSpot) {
                    SetLayerRecursively(gameObject, placeableLayer);
                } else if(gameObject.layer != doNotRenderLayer) {
                    SetLayerRecursively(gameObject, notPlaceableLayer);
                }*/
                SnapGridCenter.instance.Rotater(gameObject, Mouse.current.scroll.ReadValue().normalized.y);
            } else {
                if (validSpot) {
                    Debug.Log("GRAY");
                    PlayerStateMachine player = transform.root.GetComponent<PlayerStateMachine>();
                    gameObject.transform.parent = null;
                    SetLayerRecursively(gameObject, structureLayer);
                    player.inv.RemoveItem(player.equipItemSlot);
                    placedDown = true;
                    validSpot = false;
                } else {
                    allowMovement = true;
                }
            }
        }
    }
}
