using UnityEngine;

public class CameraController : MonoBehaviour {
    public Transform target;  // The object you want to orbit around
    public float rotationSpeed = 2.0f;
    public float zoomSpeed = 5.0f;
    public float minZoomDistance = 2.0f;
    public float maxZoomDistance = 10.0f;

    private Vector3 lastMousePosition;

    void Start() {
        if (target == null) {
            Debug.LogError("CameraController: Target not assigned!");
            enabled = false;
        }
    }

    void Update() {
        HandleRotation();
        HandleZoom();
    }

    void HandleRotation() {
        if (Input.GetMouseButtonDown(0)) {
            lastMousePosition = Input.mousePosition;
        }

        if (Input.GetMouseButton(0)) {
            Vector3 deltaMouse = Input.mousePosition - lastMousePosition;
            float rotationX = deltaMouse.y * rotationSpeed * Time.deltaTime;
            float rotationY = -deltaMouse.x * rotationSpeed * Time.deltaTime;

            transform.RotateAround(target.position, Vector3.right, rotationX);
            transform.RotateAround(target.position, Vector3.up, rotationY);
        }

        lastMousePosition = Input.mousePosition;
    }

    void HandleZoom() {
        float zoomInput = Input.GetAxis("Mouse ScrollWheel");
        float zoomAmount = zoomInput * zoomSpeed * Time.deltaTime;

        Vector3 directionToTarget = target.position - transform.position;
        float currentDistance = directionToTarget.magnitude;

        float newDistance = Mathf.Clamp(currentDistance - zoomAmount, minZoomDistance, maxZoomDistance);

        Vector3 newPosition = target.position - directionToTarget.normalized * newDistance;
        transform.position = newPosition;
    }
}
