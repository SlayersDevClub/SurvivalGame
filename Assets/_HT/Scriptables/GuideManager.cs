using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Events;

[CreateAssetMenu]
public class GuideManager : ScriptableObject {
    public GameObjectVariableReference currentGuide;

    [System.Serializable]
    public struct GuideTipEventQueues {
        public GameEvent gameEvent;
        public GameObject guideVariable; // Changed from GameObject to GameObjectVariable
    }

    public List<GuideTipEventQueues> gameTips;

    private void OnValidate() {
        foreach (GuideTipEventQueues tip in gameTips) {
            GameEventListener guideEventQueue = tip.guideVariable.transform.GetComponent<GameEventListener>();
            guideEventQueue.Event = tip.gameEvent;
            tip.gameEvent.RegisterListener(guideEventQueue); // Register listener for each GameObjectVariable

            UnityAction newGuideRequested = new UnityAction(() => ShowGuideTip(tip.guideVariable));
            guideEventQueue.Response.AddListener(newGuideRequested);
        }
    }

    public void ShowGuideTip(GameObject activeGuide) {
        currentGuide.Value = activeGuide;
    }
}
