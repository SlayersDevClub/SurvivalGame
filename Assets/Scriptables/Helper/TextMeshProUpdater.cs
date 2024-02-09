using TMPro;
using UnityEngine;

public class TextMeshProUpdater : MonoBehaviour
{
    public void MatchTextMeshProToString(int stringToMatch) {
        GetComponent<TextMeshProUGUI>().text = stringToMatch.ToString();
    }

    public void MatchTextMeshProToString(string stringToMatch) {
        GetComponent<TextMeshProUGUI>().text = stringToMatch;
    }

}
