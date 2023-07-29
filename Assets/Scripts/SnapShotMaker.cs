using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SnapShotMaker : MonoBehaviour
{
    public int resWidth = 256;
    public int resHeight = 256;

    List<GameObject> snapShotObjects = new List<GameObject>();
    public Transform snapShotObjectHolder;

    private bool takeHiResShot = false;
    Camera camera;

    private void Start()
    {
        camera = GetComponent<Camera>();

        foreach (Transform child in snapShotObjectHolder)
        {
            snapShotObjects.Add(child.gameObject);
            child.gameObject.SetActive(false);
        }

        TakeAllScreenShots();
    }
    public static string ScreenShotName(int width, int height, string name)
    {
        return string.Format("{0}/_SS/Textures/GeneratedIcons/" + name,
                             Application.dataPath,
                             width, height,
                             System.DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss"));
    }

    public void TakeAllScreenShots()
    {
        for (int i = 0; i < snapShotObjects.Count; i++)
        {
            snapShotObjects[i].SetActive(true);
            SnapShot(snapShotObjects[i].name);
            snapShotObjects[i].SetActive(false);
        }
    
    }

    void SnapShot(string name)
    {
        RenderTexture rt = new RenderTexture(resWidth, resHeight, 24);
        camera.targetTexture = rt;
        Texture2D screenShot = new Texture2D(resWidth, resHeight, TextureFormat.RGBA32, false);
        camera.Render();
        RenderTexture.active = rt;
        screenShot.ReadPixels(new Rect(0, 0, resWidth, resHeight), 0, 0);
        camera.targetTexture = null;
        RenderTexture.active = null; // JC: added to avoid errors
        Destroy(rt);
        byte[] bytes = screenShot.EncodeToPNG();
        string filename = ScreenShotName(resWidth, resHeight, name) + ".png";
        System.IO.File.WriteAllBytes(filename, bytes);
        Debug.Log(string.Format("Took screenshot to: {0}", filename));
    }
}