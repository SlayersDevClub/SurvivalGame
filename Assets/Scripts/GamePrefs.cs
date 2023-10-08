using UnityEngine;

public class GamePrefs : MonoBehaviour {
    public PlayerInputReader pir;
    public CameraNewInput cni;

    private float _mouseLookSensitivity;
    public float MouseLookSensitivity {
        get { return PlayerPrefs.GetFloat("MouseLookSensitivity"); }
        set {
            _mouseLookSensitivity = value;
            PlayerPrefs.SetFloat("MouseLookSensitivity", _mouseLookSensitivity);
            cni.UpdateSettings();
        }
    }

    private float _gamepadLookSensitivity;
    public float GamepadLookSensitivity {
        get { return PlayerPrefs.GetFloat("GamepadLookSensitivity"); }
        set {
            _gamepadLookSensitivity = value;
            PlayerPrefs.SetFloat("GamepadLookSensitivity", _gamepadLookSensitivity);
            cni.UpdateSettings();
        }
    }

    private int _invertHorizontalLook;
    public int InvertHorizontalLook {
        get { return PlayerPrefs.GetInt("InvertHorizontalLook"); }
        set {
            _invertHorizontalLook = value;
            PlayerPrefs.SetInt("InvertHorizontalLook", _invertHorizontalLook);
            cni.UpdateSettings();
        }
    }

    private int _invertVerticalLook;
    public int InvertVerticalLook {
        get { return PlayerPrefs.GetInt("InvertVerticalLook"); }
        set {
            _invertHorizontalLook = value;
            PlayerPrefs.SetInt("InvertVerticalLook", _invertVerticalLook);
            cni.UpdateSettings();
        }
    }

    void Awake() {
        //pir = GameObject.Find("Player_1").GetComponent<PlayerInputReader>();
        //cni = GameObject.Find("CameraControls").GetComponent<CameraNewInput>();
    }
}
