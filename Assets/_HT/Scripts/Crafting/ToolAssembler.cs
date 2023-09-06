using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class ToolAssembler{
    
    public static GameObject AssembleTool(GameObject toolHandle, GameObject toolHead) {
        GameObject assembledTool = new GameObject("AssembledTool");
        GameObject handleBodyJoint = new GameObject("HandleBodyJoint");
        GameObject headBodyJoint = new GameObject("HeadBodyJoint");

        GameObject.Instantiate(toolHandle);
        GameObject.Instantiate(toolHandle, handleBodyJoint.transform);
        GameObject.Instantiate(toolHead, headBodyJoint.transform);

        GameObject.Instantiate(handleBodyJoint, assembledTool.transform);
        GameObject.Instantiate(headBodyJoint, assembledTool.transform);



        return assembledTool;
    }

}
