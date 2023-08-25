using UnityEngine;
using System.Collections.Generic;

public static class ScriptableObjectIdUtility {
    private static HashSet<int> usedNumbers = new HashSet<int>();

    public static int GenerateUnique4DigitNumber() {
        int maxAttempts = 10000; // Limit the number of attempts to avoid infinite loop
        int attemptCount = 0;

        while (attemptCount < maxAttempts) {
            int randomNumber = UnityEngine.Random.Range(1000, 10000);
            if (!usedNumbers.Contains(randomNumber)) {
                usedNumbers.Add(randomNumber);
                return randomNumber;
            }
            attemptCount++;
        }

        Debug.LogError("Failed to generate a unique 4-digit number after " + maxAttempts + " attempts.");
        return 0; // Return 0 as a fallback value if unique number generation fails.
    }
}
