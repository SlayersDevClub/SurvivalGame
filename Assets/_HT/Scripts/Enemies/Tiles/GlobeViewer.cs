using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

public class GlobeViewer : MonoBehaviour {
    [Range(50, 300)]
    public float orbitSpeed;
    bool allowCameraInput;
    CinemachinePOV pov;
    CinemachineFramingTransposer frame; //set camera distance value for doing zoom
    CinemachineVirtualCamera userCam;

    // Start is called before the first frame update
    void Start() {
        userCam = GetComponent<CinemachineVirtualCamera>();
        pov = userCam.GetCinemachineComponent<CinemachinePOV>();
        frame = userCam.GetCinemachineComponent<CinemachineFramingTransposer>();
    }

    private void Awake() {
        CinemachineCore.GetInputAxis += GetAxisCustom;
    }

    float GetAxisCustom(string axisName) {
        if (!allowCameraInput) return 0;
        pov.m_VerticalAxis.m_MaxSpeed = orbitSpeed;
        pov.m_HorizontalAxis.m_MaxSpeed = orbitSpeed;
        return Input.GetAxis(axisName);
    }

    // Update is called once per frame
    void Update() {
        if (Input.GetMouseButtonDown(0)) allowCameraInput = true;
        if (Input.GetMouseButtonUp(0)) allowCameraInput = false;
    }
}