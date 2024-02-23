using UnityEngine;

public class UpgradeWindowInteractable : MonoBehaviour, IInteractable {

    public GameObject brokenTownHallPRefab;
    public GameObject townHallPrefab;

    private Canvas canvas;
    private PlayerStateMachine lastActivator;

    private void Awake() {
        GameObject newChild = Instantiate(brokenTownHallPRefab, transform.position, Quaternion.identity);
        newChild.transform.parent = transform;
        newChild.transform.localScale = new Vector3(1f, 1f, 1f);

        canvas = GetComponentInChildren<Canvas>();
        canvas.enabled = false;
    }

    public void Activate(PlayerStateMachine player) {
        lastActivator = player;
        canvas.enabled = true;
    }

    public void Deactivate(PlayerStateMachine player) {
        canvas.enabled = false;
    }

    public void Repair() {
        for (int i = 0; i < transform.childCount; i++) {
            if (transform.GetChild(i).name == "broken_townhall") {
                Destroy(transform.GetChild(i).gameObject);
                break;
            }
        }

        GameObject newChild = Instantiate(townHallPrefab, transform.position, Quaternion.identity);
        newChild.transform.parent = transform;

        lastActivator.SwitchState(lastActivator.MovingState);
        Deactivate(null);
    }

}
