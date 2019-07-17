using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class track : MonoBehaviour {


    public float speed;

    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.RotateAround(Vector3.zero, new Vector3(1f, 0f, 0f), speed * Time.deltaTime);
    }
}
