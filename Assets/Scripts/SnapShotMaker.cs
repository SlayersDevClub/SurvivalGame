using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;
#endif

/*
 * Dynamically creates icons for items based on their combination of components.
 */
public class SnapShotMaker : MonoBehaviour {
    public int resWidth = 256;
    public int resHeight = 256;
    List<GameObject> snapShotObjects = new List<GameObject>();
    public Transform snapShotObjectHolder;
    private bool takeHiResShot = false;
    public Camera camera;
    public static SnapShotMaker instance;

    private void Start() {
        instance = this;
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
        DestroyImmediate(subject);
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
        DestroyImmediate(rt);
        //byte[] bytes = screenShot.EncodeToPNG();
        //string filename = ScreenShotName(name) + ".png";
        //File.WriteAllBytes(filename, bytes);
        //Debug.Log(string.Format("Took screenshot to: {0}", filename));
        screenShot.Apply();
        return screenShot;
    }

    public Sprite SaveSpriteToScenePath(Sprite sprite) {
        byte[] spriteBytes = sprite.texture.EncodeToPNG();
        Texture2D spriteTexture = new Texture2D(sprite.texture.width, sprite.texture.height);
        spriteTexture.LoadImage(spriteBytes);

        // Create a new texture asset on the target GameObject
        Texture2D savedTexture = new Texture2D(spriteTexture.width, spriteTexture.height);
        Graphics.CopyTexture(spriteTexture, savedTexture);

        return Sprite.Create(savedTexture, new Rect(0, 0, savedTexture.width, savedTexture.height), Vector2.zero);
    }
}
