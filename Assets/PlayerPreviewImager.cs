using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPreviewImager : MonoBehaviour
{
    public GameObject PreviewPrefab;
    GameObject _previewPrefab;
    // Start is called before the first frame update
    void OnEnable()
    {
        if (_previewPrefab == null)
            _previewPrefab = Instantiate(PreviewPrefab);
        else
            _previewPrefab.SetActive(true);
    }
    private void OnDisable()
    {
        _previewPrefab.SetActive(false);
    }


}
