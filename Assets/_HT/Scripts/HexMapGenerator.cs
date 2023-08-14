using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using PathCreation;

public class HexMapGenerator : MonoBehaviour
{
    public int width;
    public int height;
    public GameObject borderTile;

    [System.Serializable]
    public struct tile{
        public int minInstances;
        public GameObject hexTile;
        public int maxInstances;
    }
   [SerializeField]
    public List<tile> tiles;

    private List<GameObject> tilesGrid;

    //ROAD
    private Vector2[] roadPoints;
    private PathCreator roadPath;
    void Start()
    {
        //Vector2[] outline = GeneratePath();
        roadPath = GetComponent<PathCreator>();
        roadPath.bezierPath = GenerateRoads(roadPoints, true);

        tilesGrid = new List<GameObject>();
        PopulateTilesGrid();
        Debug.Log(tilesGrid.Count);

        Quaternion rotation = Quaternion.Euler(0, 30, 0);
        Grid grid = transform.GetComponent<Grid>();

        int tilesGridIndex = 0;
        for(int x = 0; x < height; x++) {
            for (int y = 0; y < width; y++) {
                if (x == 0 || x == height - 1 || y == 0 || y == width - 1) {
                    Instantiate(borderTile, grid.CellToWorld(new Vector3Int(x, y, 0)), rotation);
                } else {
                    Instantiate(tilesGrid[tilesGridIndex], grid.CellToWorld(new Vector3Int(x, y, 0)), rotation);
                    tilesGridIndex++;
                }
            }
        }
    }
    private void PopulateTilesGrid() {
        List<tile> fillerTiles = new List<tile>();

        for (int i = 0; i < tiles.Count; i++) {
            tile usedTile = new tile();
            usedTile.maxInstances = tiles[i].maxInstances - tiles[i].minInstances;
            usedTile.hexTile = tiles[i].hexTile;
            usedTile.minInstances = tiles[i].minInstances;

            for (int j = 0; j < usedTile.minInstances; j++) {
                tilesGrid.Add(usedTile.hexTile);
            }

            if (usedTile.maxInstances > 0) {
                fillerTiles.Add(usedTile);
            }
        }

        while (tilesGrid.Count < width * height - (width*2+height*2)+4) {
            int randomFiller = Random.Range(0, fillerTiles.Count);

            tilesGrid.Add(fillerTiles[randomFiller].hexTile);
            if(fillerTiles[randomFiller].maxInstances - 1 == 0) {
                fillerTiles.RemoveAt(randomFiller);
            } else {
                tile usedTile = new tile();
                usedTile.hexTile = fillerTiles[randomFiller].hexTile;
                usedTile.minInstances = fillerTiles[randomFiller].minInstances;
                usedTile.maxInstances = fillerTiles[randomFiller].maxInstances - 1;
                fillerTiles[randomFiller] = usedTile;
            }

        }

        tilesGrid = RandomizeTilesGrid(tilesGrid);

    }

    private List<GameObject> RandomizeTilesGrid(List<GameObject> list) {
        int n = list.Count;
        while (n > 1) {
            n--;
            int k = Random.Range(0, n + 1);
            GameObject value = list[k];
            list[k] = list[n];
            list[n] = value;
        }

        return list;
    }

    private BezierPath GenerateRoads(Vector2[] points, bool closedPath) {

        BezierPath bezierPath = new BezierPath(points, closedPath, PathSpace.xz);

        return bezierPath;
    }
}
