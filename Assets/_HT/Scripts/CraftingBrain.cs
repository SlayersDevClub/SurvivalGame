using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public static class CraftingBrain {
    // Dictionary to store recipes with BaseItemTemplate.Id as the key
    private static Dictionary<List<string>, BaseItemTemplate> recipeDictionary = new Dictionary<List<string>, BaseItemTemplate>(new ListComparer());

    // Function to add a recipe to the dictionary
    public static void AddRecipe(List<BaseItemTemplate> ingredients, BaseItemTemplate result) {
            // Check if the provided list of ingredients has at least 2 elements and not more than 5
            if (ingredients.Count < 2 || ingredients.Count > 5) {
                Debug.LogError("Recipe should have at least 2 and at most 5 ingredients.");
                return;
            }

            List<string> notNullIngredients = new List<string>();
            // Iterate through the ingredients and add non-null items to the dictionary
            foreach (BaseItemTemplate ingredient in ingredients) {
                if (ingredient != null) {
                    notNullIngredients.Add(ingredient.Id);
                }
            }

        notNullIngredients.Sort(CompareIngredients);

        // Add the result to the dictionary as well if it is not null and not already present
        if (result != null) {
                recipeDictionary.Add(notNullIngredients, result);
        }


        }

    public static BaseItemTemplate CheckRecipe(List<BaseItemTemplate> ingredients) {
        List<string> ingredientIDS = new List<string>();

        foreach(BaseItemTemplate ing in ingredients) {
            ingredientIDS.Add(ing.Id);
        }

        ingredientIDS.Sort(CompareIngredients);

        foreach (string ing in ingredientIDS) {
            Debug.Log(ing);
        }

        Debug.Log("------------");

        KeyValuePair<List<string>, BaseItemTemplate> firstEntry = recipeDictionary.First();

        foreach(string ing in firstEntry.Key) {
            Debug.Log(ing);
        }

        BaseItemTemplate craftingOutput = null;
        try {
            //Was a valid recipe return the crafted item as an output
            craftingOutput = recipeDictionary[ingredientIDS];
            return craftingOutput;
        } catch {
            //Was not a valid recipe so return null
            return craftingOutput;
        }
    }

    private static int CompareIngredients(string a, string b) {
        // Extract the first 8 characters from the ingredient IDs
        string aNumericPart = new string(a.Take(4).Where(char.IsDigit).ToArray());
        string bNumericPart = new string(b.Take(4).Where(char.IsDigit).ToArray());

        // Parse the numeric parts using int.TryParse
        int aNumber, bNumber;
        bool aParsed = int.TryParse(aNumericPart, out aNumber);
        bool bParsed = int.TryParse(bNumericPart, out bNumber);

        // Check if parsing was successful for both numeric parts
        if (!aParsed || !bParsed) {
            // Handle parsing failure as you see fit.
            // For example, you could return 0 to indicate equality.
            return 0;
        }

        // Compare the numeric parts first
        int numberComparison = aNumber.CompareTo(bNumber);
        if (numberComparison != 0) {
            return numberComparison;
        }

        // If the numeric parts are equal, compare the alphabetic parts
        string aLetters = new string(a.Skip(8).Where(char.IsLetter).ToArray());
        string bLetters = new string(b.Skip(8).Where(char.IsLetter).ToArray());

        return string.Compare(aLetters, bLetters);
    }


public class ListComparer : IEqualityComparer<List<string>> {
    public bool Equals(List<string> x, List<string> y) {
        if (x == null || y == null)
            return false;

        return x.Count == y.Count && x.SequenceEqual(y);
    }

    public int GetHashCode(List<string> obj) {
        unchecked {
            int hash = 17;
            foreach (string s in obj) {
                hash = hash * 23 + (s != null ? s.GetHashCode() : 0);
            }
            return hash;
        }
    }
}


}