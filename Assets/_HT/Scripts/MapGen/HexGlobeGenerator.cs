using System.Linq;
using System.Collections.Generic;
using UnityEngine;

public class HexGlobeGenerator : MonoBehaviour {
    private Grid grid;

    [System.Serializable]
    public struct Tile {
        public int minInstances;
        public GameObject hexTile;
        public int maxInstances;
    }

    [System.Serializable]
    public struct RingConfiguration {
        public int ring;
        public List<Tile> tiles;
    }

    [SerializeField]
    public List<RingConfiguration> ringConfigurations;

    private List<Vector2Int> allTilesDown;

    void Start() {
        grid = GetComponent<Grid>();
        CreateRings();
    }

    private void CreateRings() {

        allTilesDown = new List<Vector2Int>() { new Vector2Int(0, 0) };

        // Tile in ring starting with center tile
        List<Vector2Int> currentTilesInRing = new List<Vector2Int>() { new Vector2Int(0, 0) };

        for (int ringCount = 0; ringCount < ringConfigurations.Count; ringCount++) {
            List<Vector2Int> nextTilesInRing = new List<Vector2Int>();

            for (int tileInRing = 0; tileInRing < currentTilesInRing.Count; tileInRing++) {
                nextTilesInRing.AddRange(GetSurroundingVertices(currentTilesInRing[tileInRing]));
            }

            currentTilesInRing = nextTilesInRing.Except(allTilesDown).ToList();

            AddNewRingTiles(currentTilesInRing, ringCount);

            allTilesDown.AddRange(currentTilesInRing);
        }
    }

    Vector2Int[] GetSurroundingVertices(Vector2Int center) {
        // Define the six neighbors' relative positions in a hexagon grid
        Vector3Int[] neighborOffsets;

        if (center.y % 2 == 0) {
            neighborOffsets = new Vector3Int[]
            {
            new Vector3Int(-1, -1, 0),
            new Vector3Int(0, -1, 0),
            new Vector3Int(1, 0, 0),
            new Vector3Int(-1, 0, 0),
            new Vector3Int(-1, 1, 0),
            new Vector3Int(0, 1, 0)
            };
        } else {
            neighborOffsets = new Vector3Int[]
            {
            new Vector3Int(1, -1, 0),
            new Vector3Int(0, -1, 0),
            new Vector3Int(1, 0, 0),
            new Vector3Int(-1, 0, 0),
            new Vector3Int(1, 1, 0),
            new Vector3Int(0, 1, 0)
            };
        }

        Vector2Int[] vertices = new Vector2Int[6];

        for (int i = 0; i < 6; i++) {
            Vector3Int offset = neighborOffsets[i];
            vertices[i] = new Vector2Int(center.x + offset.x, center.y + offset.y);
        }

        return vertices;
    }



    private void AddNewRingTiles(List<Vector2Int> newTilePositions, int ring) {
        foreach (Vector2Int newTile in newTilePositions) {
            bool anyTileHasMinInstances = ringConfigurations[ring].tiles.Any(tile => tile.minInstances > 0);

            if (anyTileHasMinInstances) {
                List<Tile> availableTiles = ringConfigurations[ring].tiles.Where(tile => tile.minInstances > 0).ToList();
                availableTiles = availableTiles.OrderBy(x => Random.value).ToList();
                Tile chosenTile = availableTiles[0];

                Instantiate(chosenTile.hexTile, grid.CellToWorld(new Vector3Int(newTile.x, newTile.y, 0)), Quaternion.identity);
                chosenTile.minInstances--;

                if (chosenTile.minInstances == 0) {
                    chosenTile.maxInstances = Mathf.Max(1, chosenTile.maxInstances);
                }

                int index = ringConfigurations[ring].tiles.FindIndex(tile => tile.hexTile == chosenTile.hexTile);
                ringConfigurations[ring].tiles[index] = chosenTile;
            } else {
                List<Tile> availableTiles = ringConfigurations[ring].tiles.Where(tile => tile.maxInstances > 0).ToList();
                availableTiles = availableTiles.OrderBy(x => Random.value).ToList();
                Tile chosenTile = availableTiles[0];

                Instantiate(chosenTile.hexTile, grid.CellToWorld(new Vector3Int(newTile.x, newTile.y, 0)), Quaternion.identity);
                chosenTile.maxInstances--;

                int index = ringConfigurations[ring].tiles.FindIndex(tile => tile.hexTile == chosenTile.hexTile);
                ringConfigurations[ring].tiles[index] = chosenTile;
            }
        }
    }


}
