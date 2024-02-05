using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

//, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerDownHandler, IPointerEnterHandler, IPointerExitHandler
public class ItemData : MonoBehaviour {
    public BaseItemTemplate item;
    /*
    public Item item;
    public int amount;
    public int slotId;

    private Inventory inv;
    private PlayerStateMachine player;
    private Inventory chestInv;
    private Tooltip tooltip;
    private Vector2 offset;

    private bool dragging = false;
    private Coroutine dragCoroutine;


    private void Start() {
        inv = FindObjectOfType<Inventory>();
        //tooltip = inv.GetComponent<Tooltip>();
        player = inv.transform.root.GetComponent<PlayerStateMachine>();
    }

    
    public void OnBeginDrag(PointerEventData eventData) {
        // You can add any additional logic here when the drag begins.
    }

    public void OnDrag(PointerEventData eventData) {
        // You can add any additional logic here during the drag.
    }

    public void OnEndDrag(PointerEventData eventData) {
        // You can add any logic here when the drag ends.
    }

    public void StopItemMouseLock() {
        dragging = false;
        this.transform.SetParent(inv.slots[slotId].transform);
        this.transform.position = inv.slots[slotId].transform.position;
        GetComponent<CanvasGroup>().blocksRaycasts = true;
    }

    public void OnPointerDown(PointerEventData eventData) {
        //Right clicking an item
        if (eventData.button == PointerEventData.InputButton.Right) {
            if(amount > 0) {
                int smallerHalf;
                int largerHalf;
                DivideNumber(amount + 1, out largerHalf, out smallerHalf);

                //Set larger item stack amount and update display number
                amount = largerHalf - 1;
                UpdateItemNumberDisplay(this);

                //Grab the larger item stack
                GrabOrSwapItemData(eventData, this);

                //Create samller item stack in the slot of the previously full stack
                inv.AddItem(item.Id, slotId);
                ItemData smallerItemStack = inv.slots[slotId].GetComponentInChildren<ItemData>();
                smallerItemStack.amount = smallerHalf - 1;
                UpdateItemNumberDisplay(smallerItemStack);
                return;
            }
           // GrabOrSwapItemData(eventData, this);
        }
        //Left clicking an item
        else {
            GrabOrSwapItemData(eventData, this);
        }

        
        
    }

    private void GrabOrSwapItemData(PointerEventData eventData, ItemData itemToGrab) {
        //If not currently holding an item hold this one
        if (player.invItemDragging == null) {

            player.invItemDragging = itemToGrab;


            offset = eventData.position - new Vector2(this.transform.position.x, this.transform.position.y);
            dragging = true;
            if (item != null) {
                this.transform.SetParent(this.transform.parent.parent);
                this.transform.position = eventData.position - offset;
                GetComponent<CanvasGroup>().blocksRaycasts = false;
            }

            // Start the coroutine and store a reference to it.
            
            dragCoroutine = StartCoroutine(LockItemToMouse(eventData));
        }
        //If holding an item place this one in that slot and hold the new one
        else {
            Debug.Log("ERROR HERE");
            inv.slots[slotId].GetComponent<Slot>().OnDrop(eventData);

            player.invItemDragging = itemToGrab;

            offset = eventData.position - new Vector2(this.transform.position.x, this.transform.position.y);
            dragging = true;
            if (item != null) {
                this.transform.SetParent(this.transform.parent.parent);
                this.transform.position = eventData.position - offset;
                GetComponent<CanvasGroup>().blocksRaycasts = false;
            }

            // Start the coroutine and store a reference to it.
            dragCoroutine = StartCoroutine(LockItemToMouse(eventData));
        }
    }
    private IEnumerator LockItemToMouse(PointerEventData eventData) {
        while (dragging) {
            this.transform.position = eventData.position - offset;
            yield return null;
        }
    }

    public void OnPointerEnter(PointerEventData eventData) {
        tooltip.Activate(item);
    }

    public void OnPointerExit(PointerEventData eventData) {
        tooltip.Deactivate();
    }

    static void DivideNumber(int number, out int largerHalf, out int smallerHalf) {
        if (number % 2 == 0) {
            largerHalf = number / 2;
            smallerHalf = number / 2;
        } else {
            largerHalf = number / 2 + 1;
            smallerHalf = number / 2;
        }
    }

    public static void UpdateItemNumberDisplay(ItemData data) {
        int displayedAmount = data.amount + 1;

        if (displayedAmount == 1) {
            data.transform.GetChild(0).GetComponent<Text>().text = "";
        } else {
            data.transform.GetChild(0).GetComponent<Text>().text = displayedAmount.ToString();
        }
    }*/
}