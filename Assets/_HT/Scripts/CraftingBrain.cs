using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public static class CraftingBrain {
    // Dictionary to store recipes with BaseItemTemplate.Id as the key
    private static Dictionary<List<string>, BaseItemTemplate> recipeDictionary = new Dictionary<List<string>, BaseItemTemplate>(new ListComparer());

    public static BaseItemTemplate AttemptCraft(List<BaseItemTemplate> ingredients) {
        BaseItemTemplate output = null;

        output = CheckRecipe(ingredients);

        if(output == null) {
            return null;
        } else {
            return output;
        }


    }
    public static GameObject AttemptBuildGun(List<BaseItemTemplate> gunParts) {
        MagTemplate mag = null;
        StockTemplate stock = null;
        BodyTemplate body = null;
        GripTemplate grip = null;
        SightTemplate sight = null;
        BarrelTemplate barrel = null;

        foreach (BaseItemTemplate part in gunParts) {
            if (part is MagTemplate) {
                Debug.Log("ONE MAG");
                mag = (MagTemplate)part;
            } else if (part is StockTemplate) {
                stock = (StockTemplate)part;
                Debug.Log("ONE STOCK");
            } else if (part is BodyTemplate) {
                body = (BodyTemplate)part;
                Debug.Log("ONE BODY");
            } else if (part is GripTemplate) {
                grip = (GripTemplate)part;
                Debug.Log("ONE GRIP");
            } else if (part is SightTemplate) {
                sight = (SightTemplate)part;
                Debug.Log("ONE SIGTH");
            } else if (part is BarrelTemplate) {
                barrel = (BarrelTemplate)part;
                Debug.Log("ONE BARREL");
            }
        }

        if (mag == null || stock == null || body == null || grip == null || sight == null || barrel == null) {
            Debug.Log("NOT VALID GUN");
            return new GameObject("EmptyGun");
        }

        GameObject builtGun = GunAssembler.AssembleGun(body.prefab, mag.prefab, sight.prefab, barrel.prefab, stock.prefab, grip.prefab);
        return builtGun;
    }


    public static BaseItemTemplate CheckRecipe(List<BaseItemTemplate> ingredients) {
        List<string> ingredientIDS = new List<string>();

        foreach (BaseItemTemplate ing in ingredients) {
            //Dont add to ingredients list to check if slot is empty
            if(ing != null) ingredientIDS.Add(ing.Id);
        }

        ingredientIDS.Sort(CompareIngredients);

        List<RecipeTemplate> recipes = JsonDataManager.LoadRecipeData();

        foreach (RecipeTemplate recipe in recipes) {
            List<string> recipeIngredientIDS = new List<string>();
            foreach (BaseItemTemplate ingredient in recipe.ingredients) {
                recipeIngredientIDS.Add(ingredient.Id);
                Debug.Log(ingredient.Id);
            }
            recipeIngredientIDS.Sort(CompareIngredients);

            if (recipeIngredientIDS.SequenceEqual(ingredientIDS)) {
                return recipe.output;
            }
        }

        // If no matching recipe found, return null
        return null;
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