using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public static class MeshGenerator {
    public static float cellSizeY = 1f;
    public static float cellSizeX = 0.866f;
    public static Vector3 gridOffset;

    public static MeshData GenerateTerrainMesh(float[,] heightMap, float heightMultiplier, AnimationCurve heightCurve) {
        int gridSizeX = heightMap.GetLength(0);
        int gridSizeY = heightMap.GetLength(1);

        List<Vector3> tempVertices = new List<Vector3>();
        List<int> tempTriangles = new List<int>();

        float vertexOffsetHeight = cellSizeY * 0.5f;
        float vertexOffsetWidth = cellSizeX * 0.5f;

        float topLeftX = (gridSizeX - 1) * -cellSizeY * 0.75f;
        float topLeftZ = (gridSizeY - 1) * cellSizeX * 0.5f;

        int vertexIndex = 0;
        int triangleIndex = 0;

        for (int x = 0; x < gridSizeX; x++) {
            for (int y = 0; y < gridSizeY; y++) {
                Vector3 cellOffset = y % 2 == 0 ?
                    new Vector3(y * cellSizeY * 3f / 4f, 0, x * cellSizeX) :
                    new Vector3(y * cellSizeY * 3f / 4f, 0, x * cellSizeX - cellSizeX / 2f);

                // Populate vertices
                Vector3[] hexVertices = new Vector3[7];
                hexVertices[0] = new Vector3(-vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;
                hexVertices[1] = new Vector3(-vertexOffsetHeight / 2f, 0, -vertexOffsetWidth) + gridOffset + cellOffset;
                hexVertices[2] = new Vector3(vertexOffsetHeight / 2f, 0, -vertexOffsetWidth) + gridOffset + cellOffset;
                hexVertices[3] = new Vector3(vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;
                hexVertices[4] = new Vector3(vertexOffsetHeight / 2f, 0, vertexOffsetWidth) + gridOffset + cellOffset;
                hexVertices[5] = new Vector3(-vertexOffsetHeight / 2f, 0, vertexOffsetWidth) + gridOffset + cellOffset;
                hexVertices[6] = new Vector3(0, 0, 0) + gridOffset + cellOffset;
                tempVertices.AddRange(hexVertices);

                // Add the new triangles to the list
                if (x < gridSizeX - 1 && y < gridSizeY - 1) {
                    int vertexBaseIndex = vertexIndex;
                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex + 1);
                    tempTriangles.Add(vertexBaseIndex);

                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex + 2);
                    tempTriangles.Add(vertexBaseIndex + 1);

                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex + 3);
                    tempTriangles.Add(vertexBaseIndex + 2);

                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex + 4);
                    tempTriangles.Add(vertexBaseIndex + 3);

                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex + 5);
                    tempTriangles.Add(vertexBaseIndex + 4);

                    tempTriangles.Add(vertexBaseIndex + 6);
                    tempTriangles.Add(vertexBaseIndex);
                    tempTriangles.Add(vertexBaseIndex + 5);
                }

                vertexIndex += 7;
            }
        }

        // Create a unique vertex array and a mapping from original vertex indices to the unique ones
        Vector3[] uniqueVertices = tempVertices.Distinct().ToArray();
        Dictionary<Vector3, int> vertexToIndexMap = new Dictionary<Vector3, int>();
        for (int i = 0; i < uniqueVertices.Length; i++) {
            vertexToIndexMap.Add(uniqueVertices[i], i);
        }

        // Use the unique vertex array to form the triangles
        int[] triangles = new int[tempTriangles.Count];
        for (int i = 0; i < tempTriangles.Count; i++) {
            triangles[i] = vertexToIndexMap[tempVertices[tempTriangles[i]]];
        }

        // Now, adjust the y coordinate of each vertex based on the height map
        for (int i = 0; i < uniqueVertices.Length; i++) {
            Vector3 vertex = uniqueVertices[i];
            vertex.y = heightCurve.Evaluate(heightMap[(int)vertex.z, (int)vertex.x]) * heightMultiplier;
            uniqueVertices[i] = vertex;
        }

        // Calculate UVs based on the vertex positions
        Vector2[] uvs = new Vector2[uniqueVertices.Length];
        for (int i = 0; i < uniqueVertices.Length; i++) {
            Vector3 vertex = uniqueVertices[i];
            uvs[i] = new Vector2((vertex.x - gridOffset.x) / (cellSizeX * gridSizeY), (vertex.z - gridOffset.z) / (cellSizeY * gridSizeX));
        }

        MeshData meshData = new MeshData(gridSizeX, gridSizeY);
        meshData.vertices = uniqueVertices;
        meshData.triangles = triangles;
        meshData.uvs = uvs;

        return meshData;
    }
}

public class MeshData {
    public Vector3[] vertices;
    public int[] triangles;
    public Vector2[] uvs;

    int triangleIndex;

    public MeshData(int meshWidth, int meshHeight) {
        int numHexagons = meshWidth * meshHeight;
        int numTrianglesPerHexagon = 6; // Each hexagon has 6 triangles
        vertices = new Vector3[numHexagons * 7]; // 7 vertices per hexagon
        uvs = new Vector2[numHexagons * 7];
        triangles = new int[numHexagons * numTrianglesPerHexagon * 3]; // 3 indices per triangle
    }

    public void AddTriangle(int a, int b, int c) {
        triangles[triangleIndex] = a;
        triangles[triangleIndex + 1] = b;
        triangles[triangleIndex + 2] = c;
        triangleIndex += 3;
    }

    public Mesh CreateMesh() {
        Mesh mesh = new Mesh();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uvs;
        mesh.RecalculateNormals();
        Debug.Log(vertices.Length);
        return mesh;
    }
}
