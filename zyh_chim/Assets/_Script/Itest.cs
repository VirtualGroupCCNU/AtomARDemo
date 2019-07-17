using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Itest : MonoBehaviour
{
    public Transform hPos;
    public Transform pPos;
    private bool exit = true;

    void Update()
    {
        Vector3 pos2 = pPos.position;
        GameObject mod = GameObject.Find("ModelObject");
        if (exit == true)
        {
            mod.transform.localScale = new Vector3(1f, 1f, 1f);
            mod.transform.position = Vector3.MoveTowards(mod.transform.position, pos2, 10f * Time.deltaTime);
        }
    }


    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0)
        {
            exit = false;
            {
                Vector3 pos1 = hPos.position;
                GameObject mod = GameObject.Find("ModelObject");
                mod.transform.position = Vector3.MoveTowards(mod.transform.position, pos1, 10f * Time.deltaTime);

                if (Vector3.Distance(pos1, mod.transform.position) < 0.05f)
                {
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
                    mod.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f);
                }
            }
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0)
        {
            exit = true;
            {
                    col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
            }
        }
    }

}