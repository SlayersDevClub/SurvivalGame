using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;

public class SnapShotMaker : MonoBehaviour {
    public int resWidth = 256;
    public int resHeight = 256;

    List<GameObject> snapShotObjects = new List<GameObject>();
    public Transform snapShotObjectHolder;

    private bool takeHiResShot = false;
    Camera camera;

    public static SnapShotMaker instance;

    private void Start() {
        instance = this;

        camera = GetComponent<Camera>();

        foreach (Transform child in snapShotObjectHolder) {
            snapShotObjects.Add(child.gameObject);
            child.gameObject.SetActive(false);
        }

        //TakeAllScreenShots();
    }

    public static string ScreenShotName(int width, int height, string name) {
        return string.Format("{0}/_SS/Textures/GeneratedIcons/" + name,
                             Application.dataPath,
                             width, height,
                             System.DateTime.Now.ToString("yyyy-MM-dd_HH-mm-ss"));
    }

    public void TakeAllScreenShots() {
        for (int i = 0; i < snapShotObjects.Count; i++) {
            snapShotObjects[i].SetActive(true);
            SnapShot(snapShotObjects[i].name);
            snapShotObjects[i].SetActive(false);
        }
    }

    public Texture2D TakeScreenShot(GameObject subject) {
        int IconMakerLayer = LayerMask.NameToLayer("IconMaker");
        subject.layer = IconMakerLayer;

        subject.transform.parent = snapShotObjectHolder;
        Texture2D screenShotTexture = SnapShot(subject.name);

        return screenShotTexture;
    }

    // Save a sprite to a PNG file
    private string SaveSpriteToPNG(Sprite sprite, string name) {
        Texture2D texture = sprite.texture;
        byte[] bytes = texture.EncodeToPNG();
        string filename = ScreenShotName(resWidth, resHeight, name) + ".png";
        System.IO.File.WriteAllBytes(filename, bytes);
        return filename;
    }

    public Texture2D SnapShot(string name) {
        RenderTexture rt = new RenderTexture(resWidth, resHeight, 32);
        camera.targetTexture = rt;
        Texture2D screenShot = new Texture2D(resWidth, resHeight, TextureFormat.RGBA32, false);
        camera.Render();
        RenderTexture.active = rt;
        screenShot.ReadPixels(new Rect(0, 0, resWidth, resHeight), 0, 0);
        camera.targetTexture = null;
        RenderTexture.active = null;
        Destroy(rt);
        byte[] bytes = screenShot.EncodeToPNG();
        string filename = ScreenShotName(resWidth, resHeight, name) + ".png";
        System.IO.File.WriteAllBytes(filename, bytes);
        Debug.Log(string.Format("Took screenshot to: {0}", filename));

        return screenShot;
    }

    public static Sprite SpriteFromTexture(Texture2D texture) {
        Sprite sprite = Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height), Vector2.one * 0.5f);
        return sprite;
    }
}
