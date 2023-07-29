using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

[ExecuteInEditMode]
public class TestGUICanvas : MonoBehaviour
{
    public TextMeshProUGUI testText;
    public Button goButton;

    public void GoButton()
    {
        testText.SetText("Hello World");
    }

}
