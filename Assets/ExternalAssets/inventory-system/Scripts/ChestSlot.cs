using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChestSlot : Slot
{
	public override void Start() {
		inv = GameObject.Find("Chest").GetComponent<Inventory>();
	}
}
