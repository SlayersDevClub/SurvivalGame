using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SliderTextSetter : MonoBehaviour
{
    TextMeshProUGUI text;
    Slider s;

    void Awake()
    {
        s = GetComponentInChildren<Slider>();
        text = transform.Find("Slider/Handle Slide Area/Handle/SliderText").GetComponent<TextMeshProUGUI>();

        s.value = PlayerPrefs.GetFloat(transform.name);
        text.SetText(s.value.ToString());
    }

    void Update()
    {
        text.SetText(s.value.ToString());
    }

}
