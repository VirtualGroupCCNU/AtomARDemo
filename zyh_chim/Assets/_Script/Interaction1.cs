using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Interaction1 : MonoBehaviour
{
    public Transform endPos1; //运动终点
    public Transform startPos1;//运动起点
    public GameObject model;//进行运动的模型
    private bool exit1 = true;//预设开始为 未碰撞状态
    public static bool move1 = false;
    public static bool other1 = true;

    void Update()
    {
        //氢原子往原点（0，0，0）运动；
        Vector3 pos2 = startPos1.position;
        GameObject mod1 = model;
        //原先是在代码中设定查找子物体；
        //GameObject mod1 = GameObject.Find("ModelObject1");
        if (exit1 == true)//未碰撞
        {
            mod1.transform.localScale = new Vector3(0.5f, 0.5f, 0.5f);
            //原先原子大小为1，现在改为0.5；
            //mod1.transform.localScale = new Vector3(1f, 1f, 1f);
            mod1.transform.position = Vector3.MoveTowards(mod1.transform.position, pos2, 10f * Time.deltaTime);
            if (Vector3.Distance(pos2, mod1.transform.position) < 0.05f)
            {
                move1 = false;//判断 本原子 是否在移动到 原点
            }
        }
    }


    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0)
        {
            exit1 = false;//发生碰撞
            {
                //发生碰撞时，氢原子往水分子处移动
                Vector3 pos1 = endPos1.position;
                GameObject mod2 = model;
                //GameObject mod = GameObject.Find("ModelObject1");
                mod2.transform.position = Vector3.MoveTowards(mod2.transform.position, pos1, 10f * Time.deltaTime);

                if (Vector3.Distance(pos1, mod2.transform.position) < 0.05f)
                {
                    move1 = true;//本原子 不在原点
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1100f, 1000f, 1100f);
                    mod2.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f);
                }
            }
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom2") == 0)
        {
            exit1 = true;//未碰撞
            if (Interaction2.move2 == false || move1 == false)//若1或2中任意一个 原子回到原点，表示氧原子可以还原
            { 
                col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                col.gameObject.GetComponent<BoxCollider>().size = new Vector3(11f, 10f, 11f);
            }
        }
    }

}