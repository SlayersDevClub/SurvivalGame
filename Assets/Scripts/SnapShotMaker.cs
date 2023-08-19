using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using System.IO;
using UnityEditor;

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
    }

    public static string ScreenShotName(string name) {
        return string.Format("{0}/_SS/Textures/GeneratedIcons/PlayerCrafting" + name,
                             Application.dataPath
                             );
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
        foreach(Transform child in subject.transform) {
            child.gameObject.layer = IconMakerLayer;
            foreach(Transform childOfChild in child.transform) {
                childOfChild.gameObject.layer = IconMakerLayer;
            }
        }

        if (subject.name == "AssembledTool")  subject.transform.parent = snapShotObjectHolder.GetChild(0);
        else subject.transform.parent = snapShotObjectHolder.GetChild(1);
        subject.transform.localPosition = Vector3.zero;
        subject.transform.localEulerAngles = Vector3.zero;
        Texture2D screenShotTexture = SnapShot(subject.name);
        Destroy(subject);
        return screenShotTexture;

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
        string filename = ScreenShotName(name) + ".png";
        File.WriteAllBytes(filename, bytes);
        Debug.Log(string.Format("Took screenshot to: {0}", filename));
        screenShot.Apply();
        return screenShot;
    }

    public Sprite SaveSpriteToEditorPath(Sprite sp, string path)
    {
        string dir = Path.GetDirectoryName(path);
        Directory.CreateDirectory(dir);

        File.WriteAllBytes(path, sp.texture.EncodeToPNG());
        AssetDatabase.Refresh();
        AssetDatabase.AddObjectToAsset(sp, path);
        AssetDatabase.SaveAssets();

        TextureImporter ti = AssetImporter.GetAtPath(path) as TextureImporter;

        ti.textureType = TextureImporterType.Sprite;
        ti.spritePixelsPerUnit = sp.pixelsPerUnit;
        ti.mipmapEnabled = false;
        ti.alphaIsTransparency = true;
        //ti.isReadable = true;
        EditorUtility.SetDirty(ti);
        ti.SaveAndReimport();

        return AssetDatabase.LoadAssetAtPath<Sprite>(path);
    }
}
