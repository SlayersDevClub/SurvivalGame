using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System;
using UnityEngine.SceneManagement;

public class Slot : MonoBehaviour
{
	/*
	public int id;
	protected private Inventory inv;
	private PlayerStateMachine player;

	public virtual void Start()
	{
		inv = GameObject.Find("Inventory").GetComponent<Inventory>();
		player = transform.root.GetComponent<PlayerStateMachine>();
	}

    public void OnDrop(PointerEventData eventData) {
		Debug.Log("DROP");
        inv.slots[id].GetComponent<SlotStateMachine>().OnDrop(eventData, id, gameObject);
    }

	public void OnPointerDown(PointerEventData eventData) {
		Debug.Log("DROPPPING");
		if(player.invItemDragging != null) {
			inv.slots[id].GetComponent<SlotStateMachine>().OnDrop(eventData, id, gameObject);
		}
	}
	*/
}