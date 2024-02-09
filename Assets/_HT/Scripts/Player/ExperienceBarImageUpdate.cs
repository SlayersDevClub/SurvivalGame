using UnityEngine.UI;
using UnityEngine;

public class ExperienceBarImageUpdate : MonoBehaviour
{
    public IntVariableReference xpForNextLevel;
    public void AdjustXPBar(int xpTowardLevel) {
        Debug.Log((float)xpTowardLevel / (float)xpForNextLevel.Value);

        GetComponent<Image>().fillAmount = (float)xpTowardLevel/(float)xpForNextLevel.Value;
    }

}
