using UnityEngine;

[CreateAssetMenu]
public class SnapGridCenter : ScriptableObject {

    public GridVariable buildingGrid;

    int groundLayer, structureLayer, doNotRenderLayer, notPlaceableLayer, placeableLayer;

    private GameObject raycastOrigin;

    private void OnEnable() {
        raycastOrigin = GameObject.Find("CameraControls");

        placeableLayer = LayerMask.NameToLayer(TagManager.PLACEABLE_LAYER);
        groundLayer = LayerMask.NameToLayer(TagManager.GROUND_LAYER);
        structureLayer = LayerMask.NameToLayer(TagManager.STRUCTURE_LAYER);
        doNotRenderLayer = LayerMask.NameToLayer(TagManager.DONOTRENDER);
        notPlaceableLayer = LayerMask.NameToLayer(TagManager.NOTPLACEABLE_LAYER);
    }
    public GameObject Placer(GameObject structure) {
        RaycastHit hit;
        Physics.Raycast(raycastOrigin.transform.position, raycastOrigin.transform.forward, out hit, 5f);

        try {
            Debug.Log(hit.point);
           
            GameObject placedStructure = Instantiate(structure, hit.point, Quaternion.identity);
            Vector3Int cellPosition = buildingGrid.Value.LocalToCell(placedStructure.transform.localPosition);
            placedStructure.transform.localPosition = buildingGrid.Value.CellToLocalInterpolated(cellPosition);

            return placedStructure;
        } catch {
            GameObject placedStructure = Instantiate(structure, Vector3.zero, Quaternion.identity);
            return placedStructure;
        }
    }

    public bool Mover(GameObject structure) {
        // Check if on top of another structure
        RaycastHit hitFromStructure;
        bool structureHit = Physics.Raycast(structure.transform.position, Vector3.up, out hitFromStructure, 50f);

        RaycastHit hitFromGround;
        bool groundHit = Physics.Raycast(raycastOrigin.transform.position, raycastOrigin.transform.forward, out hitFromGround, 15f);


        // Check if both raycasts are successful
        if (groundHit) {
            Debug.Log(hitFromGround.collider.gameObject.name);
            // Check if the hit collider is not part of the structure
            if ((structureHit && hitFromStructure.collider.gameObject.layer != structureLayer) || !structureHit) {
                // Check if the ground hit is on the GROUND_LAYER
                RaycastHit[] hitsFromGround = Physics.RaycastAll(raycastOrigin.transform.position, raycastOrigin.transform.forward, 25f);

                foreach (var hit in hitsFromGround) {
                    if (hit.collider.gameObject.layer == groundLayer) {
                        try {
                            Vector3Int cellPosition = buildingGrid.Value.LocalToCell(hit.point);
                            Quaternion newRotation = Quaternion.Euler(0f, 30f, 0f);
                            structure.transform.rotation = newRotation;
                            structure.transform.position = buildingGrid.Value.CellToLocalInterpolated(cellPosition);

                            Debug.Log("PLACEABLE");
                            SetLayerRecursively(structure.transform, placeableLayer);
                            
                            return true;
                        } catch {
                            // Change the layer of the structure and its children to Do Not Render before returning false
                            Debug.Log("NOT HITTING NOTHING");
                            
                        }
                    }
                }
            } else {
                Debug.Log("NOT PLACEABLE");
                SetLayerRecursively(structure.transform, notPlaceableLayer);
                return false;
            }
        } else {
            Debug.Log("NO RENDER");
            SetLayerRecursively(structure.transform, doNotRenderLayer);
            
        }

        return false;
    }

    // Function to recursively set the layer of an object and its children
    private void SetLayerRecursively(Transform obj, int newLayer) {
        obj.gameObject.layer = newLayer;
        foreach (Transform child in obj) {
            SetLayerRecursively(child, newLayer);
        }
    }



    public void Rotater(GameObject structure, float rotateDirection) {
        Debug.Log(rotateDirection);
        if (rotateDirection < 0) {
            // Rotate 30 degrees to the left (counterclockwise)
            structure.transform.Rotate(Vector3.up, -30f);
        } else if (rotateDirection > 0) {
            // Rotate 30 degrees to the right (clockwise)
            structure.transform.Rotate(Vector3.up, 30f);
        }
    }



}



