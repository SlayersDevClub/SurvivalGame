using UnityEngine;
using System.Collections;
public class SnapGridCenter : MonoBehaviour {
    public GameObject obj;
    public Grid grid;


    public static SnapGridCenter instance;
    private void Start() {
        instance = this;
    }
    public GameObject Placer(GameObject structure) {
        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f);

        try {
            Debug.Log(hit.point);
           
            GameObject placedStructure = Instantiate(structure, hit.point, Quaternion.identity);
            Vector3Int cellPosition = grid.LocalToCell(placedStructure.transform.localPosition);
            placedStructure.transform.localPosition = grid.CellToLocalInterpolated(cellPosition);

            return placedStructure;
        } catch {
            GameObject placedStructure = Instantiate(structure, Vector3.zero, Quaternion.identity);
            return placedStructure;
        }
    }

    public bool Mover(GameObject structure) {
        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f);

        try {
            
            Vector3Int cellPosition = grid.LocalToCell(hit.point);

            Quaternion newRotation = Quaternion.Euler(0f, 30f, 0f);
            structure.transform.rotation = newRotation;

            //structure.transform.rotation = Quaternion.identity;
            structure.transform.position = grid.CellToLocalInterpolated(cellPosition);
            return true;
        } catch {
            return false;
        }
    }


}



