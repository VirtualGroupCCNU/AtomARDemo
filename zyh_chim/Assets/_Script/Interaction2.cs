using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Interaction2 : MonoBehaviour
{
    public Transform endPos2;
    public Transform startPos2;
    public GameObject model;
    private bool exit2 = true;
    public static bool move2 = false;
    public static bool other2 = true;

    void Update()
    {
        //氢原子往原点（0，0，0）运动
        Vector3 pos2 = startPos2.position;
        GameObject mod1 = model;
        //GameObject mod1 = GameObject.Find("ModelObject2");

        if (exit2 == true)
        {
            mod1.transform.localScale = new Vector3(0.5f, 0.5f, 0.5f);
            //原先原子大小为1，现在改为0.5
            //mod1.transform.localScale = new Vector3(1f, 1f, 1f);
            mod1.transform.position = Vector3.MoveTowards(mod1.transform.position, pos2, 10f * Time.deltaTime);
            if (Vector3.Distance(pos2, mod1.transform.position) < 0.05f)
                move2 = false;
        }
    }


    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0 )
        {
            exit2 = false;
            {
                Vector3 pos1 = endPos2.position;
                GameObject mod2 = model;
                //GameObject mod = GameObject.Find("ModelObject2");
                mod2.transform.position = Vector3.MoveTowards(mod2.transform.position, pos1, 10f * Time.deltaTime);

                if (Vector3.Distance(pos1, mod2.transform.position) < 0.05f)
                {
                    move2 = true;
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1100f, 1000f, 1100f);
                    mod2.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f);
                }
            }
        }
    }


     void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0 )
        {
            exit2 = true;
            if (Interaction1.move1 == false || move2 == false)
            {
                col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                col.gameObject.GetComponent<BoxCollider>().size = new Vector3(11f, 10f, 11f);
            }
        }
    }

}