using UnityEngine;
using UnityEngine.UI;
public class PlayerExperience : MonoBehaviour
{
    private int[] xpPerLevelup = {1,2,3,4,5,6,7,8,9,10 };
    private int recipeUnlockPointsPerLevel = 2;

    public IntVariableReference playerLevel;
    public StringVariableReference playerLevelText;
    public IntVariableReference recipeUnlockPoints;

    public IntVariableReference xpToNextLevel;
    public IntVariableReference xpForNextLevel;
    
    private void Start() {
        xpToNextLevel.Value = 0;
        playerLevel.Value = 0;
        recipeUnlockPoints.Value = 0;
        xpForNextLevel.Value = xpPerLevelup[playerLevel.Value];
    }

    public void ApplyPlayerXP(int xpGranted) {
        Debug.Log(xpGranted);
        while(xpGranted >= xpPerLevelup[playerLevel.Value]) {
            xpGranted -= xpPerLevelup[playerLevel.Value];
            

            playerLevel.Value += 1;
            recipeUnlockPoints.Value += recipeUnlockPointsPerLevel;
            xpForNextLevel.Value = xpPerLevelup[playerLevel.Value];
        }

        xpPerLevelup[playerLevel.Value] -= xpGranted;
        xpToNextLevel.Value = xpGranted;
    }
}
