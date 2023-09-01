using UnityEngine;

public class TerrainVegetationScatter : MonoBehaviour
{
    public Texture2D splatmap;
    public GameObject vegetationPrefab;
    public float placementThreshold = 0.5f;

    private Terrain terrain;

    void Start()
    {
        terrain = GetComponent<Terrain>();
        ScatterVegetation();
    }

    void ScatterVegetation()
    {
        // Iterate through the splatmap pixels
        for (int x = 0; x < splatmap.width; x++)
        {
            for (int y = 0; y < splatmap.height; y++)
            {
                float[,,] weights = terrain.terrainData.GetAlphamaps(x, y, 1, 1);

                // Iterate through the textures and check their weights
                for (int textureIndex = 0; textureIndex < terrain.terrainData.terrainLayers.Length; textureIndex++)
                {
                    if (weights[0, 0, textureIndex] > placementThreshold)
                    {
                        // Calculate world position
                        Vector3 position = new Vector3(x * terrain.terrainData.size.x / splatmap.width,
                                                      terrain.SampleHeight(new Vector3(x * terrain.terrainData.size.x / splatmap.width, 0, y * terrain.terrainData.size.z / splatmap.height)),
                                                      y * terrain.terrainData.size.z / splatmap.height);

                        // Instantiate vegetation at position
                        Instantiate(vegetationPrefab, position, Quaternion.identity);
                    }
                }

                // Check if the desired texture's weight is above the threshold
                if (weights[1,1,1] > placementThreshold)
                {
                    // Calculate world position
                    Vector3 position = new Vector3(x * terrain.terrainData.size.x / splatmap.width,
                                                  terrain.SampleHeight(new Vector3(x * terrain.terrainData.size.x / splatmap.width, 0, y * terrain.terrainData.size.z / splatmap.height)),
                                                  y * terrain.terrainData.size.z / splatmap.height);

                    // Instantiate vegetation at position
                    Instantiate(vegetationPrefab, position, Quaternion.identity);
                }
            }
        }
    }
}

