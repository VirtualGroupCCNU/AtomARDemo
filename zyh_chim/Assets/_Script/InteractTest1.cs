using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class InteractTest1 : MonoBehaviour
{


    //void OnTriggerEnter(Collider col)
    //{
    //    if (col.gameObject.tag.CompareTo("Atom1") == 0)
    //    {
    //        //col.transform.Translate(Vector3.right * 100f * Time.deltaTime, Space.World);
    //        // col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
    //        //   col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
    //        //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(false);
    //        //transform.Find("H Pos1").gameObject.SetActive(true);
    //        transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
    //        gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            
    //    }
    //    else if (col.gameObject.tag.CompareTo("Atom3") == 0)
    //    {
    //        col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
    //        col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
    //        transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
    //        gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
    //    }
    //}

    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            {
                Vector3 pos1 = GameObject.Find("H Pos1 (1)").transform.position;
                GameObject mod = col.transform.Find("ModelObject").gameObject;
                mod.transform.position = Vector3.MoveTowards(mod.transform.position, pos1, 5f * Time.deltaTime);
                //col.gameObject.transform.Find("ModelObject").gameObject.transform.position = Vector3.MoveTowards(col.gameObject.transform.position, pos1, 5f * Time.deltaTime);
                //col.gameObject.transform.position = Vector3.MoveTowards(col.gameObject.transform.position, pos1, 5f * Time.deltaTime);
                
                if (Vector3.Distance(pos1,col.gameObject.transform.position)< 0.05f)
                {
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
                    col.gameObject.GetComponent<BoxCollider>().center = new Vector3(-6.5f, 0f, 2.5f);
                    transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
                   
                }
                
                //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(false);
                //transform.Find("H Pos1").gameObject.SetActive(true);
                

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
                Vector3 pos1 = GameObject.Find("H Pos1 (1)").transform.position;
                col.gameObject.transform.position = Vector3.MoveTowards(col.gameObject.transform.position,new Vector3(0f,0.5f,0f), 5f * Time.deltaTime);
                if (Vector3.Distance(col.gameObject.transform.position, new Vector3(0f, 0.5f, 0f)) <0.1f)
                {
                //col.gameObject.transform.localPosition = Vector3.MoveTowards(gameObject.transform.localPosition, col.gameObject.transform.localPosition, 1f * Time.deltaTime);
                //    // col.transform.Find("ModelObject").Translate(Vector3.left * 100f * Time.deltaTime, Space.World);
                    col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
                    transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
                }
                //col.gameObject.transform.Find("Hydrogen").gameObject.SetActive(true);
                //col.gameObject.transform.Find("Hydrogen/Nucleus/Electronic/Electronic_Model").GetComponent<OrbitMotion>().enabled = true;
                //transform.Find("H Pos1").gameObject.SetActive(false);
                

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