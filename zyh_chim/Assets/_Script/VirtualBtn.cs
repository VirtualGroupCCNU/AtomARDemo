using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class VirtualBtn : MonoBehaviour ,IVirtualButtonEventHandler{

    public GameObject btnObj;
    public GameObject btnText;
    public GameObject panel;


	void Start () {
        btnObj = GameObject.Find("DetailsButton");
        btnObj.GetComponent<VirtualButtonBehaviour>().RegisterEventHandler(this);
        panel.SetActive(false);

    }
	
    public void OnButtonPressed(VirtualButtonBehaviour vb)
    {
        if (Interaction1.move1 && Interaction2.move2)
        {
            panel .SetActive(true);
            Debug.Log("BTN Pressed");
        }
    }

    public void OnButtonReleased(VirtualButtonBehaviour vb)
    {
        panel.SetActive(false);
        Debug.Log("BTN Released");
    }

	void Update () {
        if (Interaction1.move1 && Interaction2.move2)
        {
            btnText.SetActive(true);
        }
        else
        {
           btnText.SetActive(false);
        }

    }

}
