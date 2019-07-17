using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class InteractTest : MonoBehaviour
{


    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
                    //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(false);
                    //transform.Find("H Pos1").gameObject.SetActive(true);
                    transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
        }
    }

    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            {
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
                    //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(false);
                    //transform.Find("H Pos1").gameObject.SetActive(true);
                    transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);

            }
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            {
                    col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
                    //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(true);
                    //col.gameObject.transform.Find("Hydrogen/Nucleus/Electronic/Electronic_Model").GetComponent<OrbitMotion>().enabled = true;
                    //transform.Find("H Pos1").gameObject.SetActive(false);
                    transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);

            }
           
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
            transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
        }
    }
}