using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEditor;
public class CraftingBrain : MonoBehaviour {
    // Dictionary to store recipes with BaseItemTemplate.Id as the key
    private static Dictionary<List<string>, BaseItemTemplate> recipeDictionary = new Dictionary<List<string>, BaseItemTemplate>(new ListComparer());

    public static CraftingBrain instance;

    private void Start() {
        instance = this;

        if (GameObject.Find("CustomItems") == null) {
            GameObject.Instantiate(new GameObject("CustomItems"));
        }
    }

    public static BaseItemTemplate AttemptCraft(List<BaseItemTemplate> ingredients) {
        BaseItemTemplate output = null;

        output = CheckRecipe(ingredients);

        if(output == null) {
            return null;
        } else {
            return output;
        }
    }
    
    public static BaseItemTemplate AttemptBuildTool(List<BaseItemTemplate> toolParts, string id = null) {
        PickaxeHandleTemplate pickHand = null;
        AxeHandleTemplate axeHand = null;
        HammerHandleTemplate hammerHand = null;

        PickaxePickTemplate pickHead = null;
        AxeBladeTemplate axeHead = null;
        HammerHeadTemplate hammerHead = null;

        foreach (BaseItemTemplate part in toolParts) {
            if (part is PickaxeHandleTemplate) {
                pickHand = (PickaxeHandleTemplate)part;
            } else if (part is AxeHandleTemplate) {
                axeHand = (AxeHandleTemplate)part;
            } else if (part is HammerHandleTemplate) {
                hammerHand = (HammerHandleTemplate)part;
            } else if (part is PickaxePickTemplate) {
                pickHead = (PickaxePickTemplate)part;
            } else if (part is AxeBladeTemplate) {
                axeHead = (AxeBladeTemplate)part;
            } else if (part is HammerHeadTemplate) {
                hammerHead = (HammerHeadTemplate)part;
            }
        }

        if ((pickHand != null && pickHead != null) ||
        (axeHand != null && axeHead != null) ||
        (hammerHand != null && hammerHead != null)) {

            ToolTemplate newToolTemplate = ScriptableObject.CreateInstance<ToolTemplate>();
            if(id != null) {
                newToolTemplate.Id = id;
            }

            BaseItemTemplate handle = null;
            BaseItemTemplate head = null;

            if (pickHand != null) {
                handle = pickHand;
                head = pickHead;

                newToolTemplate.axeStrength = pickHand.axeStrength + pickHead.axeStrength;
                newToolTemplate.pickaxeStrength = pickHand.pickaxeStrength + pickHead.pickaxeStrength;
                newToolTemplate.swingSpeed = pickHand.swingSpeed + pickHead.swingSpeed;
                newToolTemplate.damage = pickHand.damage + pickHead.damage;
                newToolTemplate.partPrefabPaths = new BaseItemTemplate[]{pickHand, pickHead};
            } else if (axeHand != null) {
                handle = axeHand;
                head = axeHead;

                newToolTemplate.axeStrength = axeHand.axeStrength + axeHead.axeStrength;
                newToolTemplate.pickaxeStrength = axeHand.pickaxeStrength + axeHead.pickaxeStrength;
                newToolTemplate.swingSpeed = axeHand.swingSpeed + axeHead.swingSpeed;
                newToolTemplate.damage = axeHand.damage + axeHead.damage;
                newToolTemplate.partPrefabPaths = new BaseItemTemplate[] { axeHand, axeHead };
            } else {
                handle = hammerHand;
                head = hammerHead;

                newToolTemplate.partPrefabPaths = new BaseItemTemplate[] { hammerHand, hammerHead };
            }

            GameObject builtTool = ToolAssembler.AssembleTool(handle.prefab, head.prefab);

            // Determine the type of tool and add the corresponding component
            if (pickHand != null) {
                builtTool.AddComponent<PickaxeUsable>();
            } else if (axeHand != null) {
                builtTool.AddComponent<AxeUsable>();
            } else {
                builtTool.AddComponent<HammerUsable>();
            }

            builtTool.AddComponent<ItemSetup>();

            builtTool.GetComponent<ItemSetup>().SetBaseItemTemplate(newToolTemplate);
            //Set object to Equipped layer for camera culling
            //foreach (Transform child in builtTool.GetComponentsInChildren<Transform>())
            //{
            //    child.gameObject.layer = LayerMask.NameToLayer("Equipped");
            //}

            GameObject createdTool = GameObject.Instantiate(builtTool, GameObject.Find("CustomItems").transform);
            createdTool.name = "CustomTool" + newToolTemplate.Id.ToString();

            newToolTemplate.prefab = builtTool;
            newToolTemplate.itemName = "CustomTool" + newToolTemplate.Id.ToString();
            newToolTemplate.name = "CustomTool" + newToolTemplate.Id.ToString();
            //Create the item's texture
            Texture2D screenshotTexture = SnapShotMaker.instance.TakeScreenShot(builtTool);
            //Create sprite from texture
            Sprite iconSprite = Sprite.Create(screenshotTexture, new Rect(0, 0, screenshotTexture.width, screenshotTexture.height), Vector2.zero);
            //Save the sprite to disk
            var newSprite= SnapShotMaker.instance.SaveSpriteToScenePath(iconSprite);
            //Set loaded sprite as icon
            newToolTemplate.icon = newSprite;

            return newToolTemplate;

        } else {
            return null;
        }

    }


public static BaseItemTemplate AttemptBuildGun(List<BaseItemTemplate> gunParts, string id = null) {
        MagTemplate mag = null;
        StockTemplate stock = null;
        BodyTemplate body = null;
        GripTemplate grip = null;
        SightTemplate sight = null;
        BarrelTemplate barrel = null;

        foreach (BaseItemTemplate part in gunParts) {
            if (part is MagTemplate) {
                mag = (MagTemplate)part;
            } else if (part is StockTemplate) {
                stock = (StockTemplate)part;
            } else if (part is BodyTemplate) {
                body = (BodyTemplate)part;
            } else if (part is GripTemplate) {
                grip = (GripTemplate)part;
            } else if (part is SightTemplate) {
                sight = (SightTemplate)part;
            } else if (part is BarrelTemplate) {
                barrel = (BarrelTemplate)part;
            }
        }

        if (mag == null || stock == null || body == null || grip == null || sight == null || barrel == null) {
            Debug.Log("REACHED");
            return null;
        }

        GunTemplate newGunTemplate = ScriptableObject.CreateInstance<GunTemplate>();
        if (id != null) {
            newGunTemplate.Id = id;
        }

        newGunTemplate.Init(barrel.shootForce, barrel.upwardForce, grip.timeBetweenShooting, sight.spread, mag.reloadTime, grip.timeBetweenShots, mag.magazineSize, grip.bulletsPerTap, stock.recoilForce, body.damage, body.allowButtonHold);
        newGunTemplate.partPrefabPaths = new BaseItemTemplate[] { body, mag, sight, barrel, stock, grip };


        GameObject builtGun = GunAssembler.AssembleGun(body.prefab, mag.prefab, sight.prefab, barrel.prefab, stock.prefab, grip.prefab);
        builtGun.AddComponent<GunUsable>();
        builtGun.AddComponent<ItemSetup>();

        builtGun.GetComponent<ItemSetup>().SetBaseItemTemplate(newGunTemplate);

        //Set object to Equipped layer for camera culling
        //foreach (Transform child in builtGun.GetComponentsInChildren<Transform>())
        //{
        //    child.gameObject.layer = LayerMask.NameToLayer("Equipped");
        //}

        //Create the item's texture
        Texture2D screenshotTexture = SnapShotMaker.instance.TakeScreenShot(builtGun);
        //Create sprite from texture
        Sprite iconSprite = Sprite.Create(screenshotTexture, new Rect(0, 0, screenshotTexture.width, screenshotTexture.height), Vector2.zero);
        //Save the sprite to disk
        var newSprite = SnapShotMaker.instance.SaveSpriteToScenePath(iconSprite);
        //Set loaded sprite as icon
        newGunTemplate.icon = newSprite;

        GameObject createdGun = GameObject.Instantiate(builtGun, GameObject.Find("CustomItems").transform);
        createdGun.name = "CustomGun" + newGunTemplate.Id.ToString();
        
        newGunTemplate.prefab = builtGun;
        newGunTemplate.itemName = "CustomGun" + newGunTemplate.Id.ToString();
        newGunTemplate.name = "CustomGun" + newGunTemplate.Id.ToString();

        return newGunTemplate;
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