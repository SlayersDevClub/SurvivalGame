using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System;
using UnityEngine.SceneManagement;

public class Slot : MonoBehaviour, IDropHandler
{
	public int id;
	protected private Inventory inv;

	public virtual void Start()
	{
		inv = GameObject.Find("Inventory").GetComponent<Inventory>();
	}

    public void OnDrop(PointerEventData eventData) {
        inv.slots[id].GetComponent<SlotStateMachine>().OnDrop(eventData, id, gameObject);

    }
}