using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HexMapGenerator : MonoBehaviour
{
    public int width;
    public int height;
    public GameObject borderTile;
    public List<GameObject> tiles;

    void Start()
    {
        Quaternion rotation = Quaternion.Euler(0, 30, 0);
        Grid grid = transform.GetComponent<Grid>();

        for(int x = 0; x < height; x++) {
            for (int y = 0; y < width; y++) {
                if (x == 0 || x == height - 1 || y == 0 || y == width - 1) {
                    Instantiate(borderTile, grid.CellToWorld(new Vector3Int(x, y, 0)), rotation);
                } else {
                    Instantiate(tiles[Random.Range(0, tiles.Count)], grid.CellToWorld(new Vector3Int(x, y, 0)), rotation);
                }
            }
        }
    }


}
