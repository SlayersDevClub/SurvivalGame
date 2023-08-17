using UnityEngine;
using System.Collections;
public class SnapGridCenter : MonoBehaviour {
    public GameObject obj;
    public Grid grid;
    private void Start() {
        //InvokeRepeating("Placer", 0f, 2f);
    }
    void Placer() {
        RaycastHit hit;
        Physics.Raycast(GameObject.Find("CameraControls").transform.position, GameObject.Find("CameraControls").transform.forward, out hit, 5f);

        try {
            Debug.Log(hit.point);
            
            GameObject cube = Instantiate(obj, hit.point, Quaternion.identity);
            Vector3Int cellPosition = grid.LocalToCell(cube.transform.localPosition);
            cube.transform.localPosition = grid.CellToLocalInterpolated(cellPosition);

        } catch {

        }
    }


}



