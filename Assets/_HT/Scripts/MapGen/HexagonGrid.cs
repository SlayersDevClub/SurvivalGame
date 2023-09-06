using System.Collections;
using System.Linq;
using System.Collections.Generic;

using UnityEngine;



public class HexagonGrid : MonoBehaviour {

    Mesh mesh;

    //Vector3[] vertices;

    //int[] triangles;



    public float cellSizeY = 1f;

    public float cellSizeX = 0.866f;

    public Vector3 gridOffset;

    public int gridSizeX;

    public int gridSizeY;

    List<Vector3> vertices = new List<Vector3>();
    List<int> triangles = new List<int>();

    void Awake() {

        mesh = GetComponent<MeshFilter>().mesh;
    }



    void Start() {

        GenerateContinuosProceduralGrid();

        UpdateMesh();

    }



    private void GenerateDiscreteProceduralGrid() {

        //set array sizes

        //vertices = new Vector3[gridSizeX * gridSizeY * 7];

        //triangles = new int[gridSizeX * gridSizeY * 18];



        //set tracker integers

        int v = 0;

        int t = 0;



        //set vertex offset

        float vertexOffsetHeight = cellSizeY * 0.5f;

        float vertexOffsetWidth = cellSizeX * 0.5f;



        for (int x = 0; x < gridSizeX; x++) {

            for (int y = 0; y < gridSizeY; y++) {

                Vector3 cellOffset;

                if (y % 2 == 0) {

                    cellOffset = new Vector3(y * cellSizeY * 3 / 4, 0, x * cellSizeX);

                } else {

                    cellOffset = new Vector3(y * cellSizeY * 3 / 4, 0, x * cellSizeX - cellSizeX / 2);

                }



                //populate vertices and triangles arrays 

                vertices[v] = new Vector3(-vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;

                vertices[v + 1] = new Vector3(-vertexOffsetHeight / 2, 0, -vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 2] = new Vector3(vertexOffsetHeight / 2, 0, -vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 3] = new Vector3(vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;

                vertices[v + 4] = new Vector3(vertexOffsetHeight / 2, 0, vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 5] = new Vector3(-vertexOffsetHeight / 2, 0, vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 6] = new Vector3(0, 0, 0) + gridOffset + cellOffset;



                triangles[t + 0] = v + 6;

                triangles[t + 1] = v + 1;

                triangles[t + 2] = v + 0;

                triangles[t + 3] = v + 6;

                triangles[t + 4] = v + 2;

                triangles[t + 5] = v + 1;

                triangles[t + 6] = v + 6;

                triangles[t + 7] = v + 3;

                triangles[t + 8] = v + 2;

                triangles[t + 9] = v + 6;

                triangles[t + 10] = v + 4;

                triangles[t + 11] = v + 3;

                triangles[t + 12] = v + 6;

                triangles[t + 13] = v + 5;

                triangles[t + 14] = v + 4;

                triangles[t + 15] = v + 6;

                triangles[t + 16] = v + 0;

                triangles[t + 17] = v + 5;



                v += 7;

                t += 18;





            }

        }


    }



    private void GenerateContinuosProceduralGrid() {

        //set array sizes

        /*
        vertices = new Vector3[gridSizeX * gridSizeY * 7];

        triangles = new int[gridSizeX * gridSizeY * 18];



        //set tracker integers

        int v = 0;

        int t = 0;



        //set vertex offset

        float vertexOffsetHeight = cellSizeY * 0.5f;

        float vertexOffsetWidth = cellSizeX * 0.5f;



        for (int x = 0; x < gridSizeX; x++) {

            for (int y = 0; y < gridSizeY; y++) {

                Vector3 cellOffset;

                if (y % 2 == 0) {

                    cellOffset = new Vector3(y * cellSizeY * 3 / 4, 0, x * cellSizeX);

                } else {

                    cellOffset = new Vector3(y * cellSizeY * 3 / 4, 0, x * cellSizeX - cellSizeX / 2);

                }



                //populate vertices and triangles arrays 

                vertices[v] = new Vector3(-vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;

                vertices[v + 1] = new Vector3(-vertexOffsetHeight / 2, 0, -vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 2] = new Vector3(vertexOffsetHeight / 2, 0, -vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 3] = new Vector3(vertexOffsetHeight, 0, 0) + gridOffset + cellOffset;

                vertices[v + 4] = new Vector3(vertexOffsetHeight / 2, 0, vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 5] = new Vector3(-vertexOffsetHeight / 2, 0, vertexOffsetWidth) + gridOffset + cellOffset;

                vertices[v + 6] = new Vector3(0, 0, 0) + gridOffset + cellOffset;



                triangles[t + 0] = v + 6;

                triangles[t + 1] = v + 1;

                triangles[t + 2] = v + 0;

                triangles[t + 3] = v + 6;

                triangles[t + 4] = v + 2;

                triangles[t + 5] = v + 1;

                triangles[t + 6] = v + 6;

                triangles[t + 7] = v + 3;

                triangles[t + 8] = v + 2;

                triangles[t + 9] = v + 6;

                triangles[t + 10] = v + 4;

                triangles[t + 11] = v + 3;

                triangles[t + 12] = v + 6;

                triangles[t + 13] = v + 5;

                triangles[t + 14] = v + 4;

                triangles[t + 15] = v + 6;

                triangles[t + 16] = v + 0;

                triangles[t + 17] = v + 5;



                v += 7;

                t += 18;





            }

        }




        Vector3[] vectorArray = vertices;
        Vector3[] uniqueVectorArray = RemoveDuplicatesAndGetUniqueElements(vectorArray, out DuplicateInfo<Vector3>[] duplicatesInfo);

        vertices = uniqueVectorArray;
        for (int i = 0; i < uniqueVectorArray.Length; i++) {
            for(int j = 0; j< vectorArray.Length; j++) {
                if(vectorArray[j] == uniqueVectorArray[i]) {
                    for(int k =0; k < triangles.Length; k++) {
                        if(triangles[k] == j) {
                            triangles[k] = i;
                        }
                    }
                }
            }
        }

        for(int i = 0; i< vertices.Length; i++) {
            vertices[i] = vertices[i] + new Vector3(0, Mathf.PerlinNoise(vertices[i].x * .3f, vertices[i].z*.3f), 0);
        }

    }*/
        float vertexOffsetHeight = cellSizeY * 0.5f;
        float vertexOffsetWidth = cellSizeX * 0.5f;

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

                // Add the new vertices to the list
                vertices.AddRange(hexVertices);

                // Populate triangles
                int baseVertex = vertices.Count - 7;

                // Bottom left triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 1);
                triangles.Add(baseVertex + 0);

                // Bottom right triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 2);
                triangles.Add(baseVertex + 1);

                // Right triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 3);
                triangles.Add(baseVertex + 2);

                // Top right triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 4);
                triangles.Add(baseVertex + 3);

                // Top left triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 5);
                triangles.Add(baseVertex + 4);

                // Left triangle
                triangles.Add(baseVertex + 6);
                triangles.Add(baseVertex + 0);
                triangles.Add(baseVertex + 5);
            }
        }

        // Apply Perlin noise to Y-coordinate of vertices
        for (int i = 0; i < vertices.Count; i++) {
            Vector3 vertex = vertices[i];
            vertex.y += Mathf.PerlinNoise(vertex.x * .3f, vertex.z * .3f) * .7f;
            vertices[i] = vertex;
        }
    }


    Vector3[] RemoveDuplicatesAndGetUniqueElements(Vector3[] vectorArray, out DuplicateInfo<Vector3>[] duplicatesInfo) {
        List<DuplicateInfo<Vector3>> duplicatesList = new List<DuplicateInfo<Vector3>>();
        Dictionary<Vector3, int> vectorToOriginalIndexMap = new Dictionary<Vector3, int>();
        List<Vector3> uniqueVectorList = new List<Vector3>();

        for (int i = 0; i < vectorArray.Length; i++) {
            if (!vectorToOriginalIndexMap.ContainsKey(vectorArray[i])) {
                vectorToOriginalIndexMap[vectorArray[i]] = i;
                uniqueVectorList.Add(vectorArray[i]);
            } else {
                int originalIndex = vectorToOriginalIndexMap[vectorArray[i]];
                if (!duplicatesList.Any(d => d.OriginalIndex == originalIndex)) {
                    duplicatesList.Add(new DuplicateInfo<Vector3> { OriginalIndex = originalIndex, DuplicateIndexes = new int[] { i }, Value = vectorArray[i] });
                } else {
                    var existingDuplicate = duplicatesList.First(d => d.OriginalIndex == originalIndex);
                    int[] newDuplicateIndexes = existingDuplicate.DuplicateIndexes.Concat(new int[] { i }).ToArray();
                    existingDuplicate.DuplicateIndexes = newDuplicateIndexes;
                }
            }
        }

        duplicatesInfo = duplicatesList.ToArray();
        return uniqueVectorList.ToArray();
    }


    public static int[] ChangeIntegersWithDuplicates<T>(DuplicateInfo<T>[] duplicatesInfo, int[] integerArray) {
        foreach (var duplicateInfo in duplicatesInfo) {
            foreach (int duplicateIndex in duplicateInfo.DuplicateIndexes) {

                int originalIndex = duplicateInfo.OriginalIndex;

                for (int i = 0; i < integerArray.Length; i++) {
                    if (integerArray[i] == duplicateIndex) {
                        integerArray[i] = originalIndex;
                    }
                }

            }
        }

        return integerArray;
    }

    public class DuplicateInfo<T> {
        public int OriginalIndex { get; set; }
        public int[] DuplicateIndexes { get; set; }
        public T Value { get; set; }
    }

    private void UpdateMesh() {

        mesh.Clear();



        mesh.vertices = vertices.ToArray();

        mesh.triangles = triangles.ToArray();

        mesh.RecalculateNormals();

    }

}