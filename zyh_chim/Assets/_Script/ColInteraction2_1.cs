using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//三原子组成&碰撞代码其一
public class ColInteraction2_1 : MonoBehaviour
{
    public string moleName;
    public Transform endPos1; //运动终点
    public GameObject model;//进行运动的模型
    public string colName;//碰撞物体的名字


    void OnTriggerStay(Collider col)
    {
        //if (col.gameObject.tag.CompareTo("Atom2") == 0)
        if (col.gameObject.name.CompareTo(colName) == 0)
        {
           UpdateMove.bodyAlone = false;//发生碰撞
            {
                //发生碰撞时，氢原子往水分子处移动
                Vector3 pos1 = endPos1.position;
                GameObject mod2 = model;
                //GameObject mod = GameObject.Find("ModelObject1");
                mod2.transform.position = Vector3.MoveTowards(mod2.transform.position, pos1, 10f * Time.deltaTime);

                if (Vector3.Distance(pos1, mod2.transform.position) < 0.05f)
                {
                    UpdateMove.move = true;//本原子 不在原点
                    col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                    col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1100f, 1000f, 1100f);
                    mod2.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f);
                }
            }
        }
    }


    void OnTriggerExit(Collider col)
    {
        //if (col.gameObject.tag.CompareTo("Atom2") == 0)
        if (col.gameObject.name.CompareTo(colName) == 0)
        {
            UpdateMove.bodyAlone = true;//未碰撞
            if (UpdateMove_2.move2 == false || UpdateMove.move == false)//若1或2中任意一个 原子回到原点，表示氧原子可以还原
            {
                col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                col.gameObject.GetComponent<BoxCollider>().size = new Vector3(11f, 10f, 11f);
            }
        }
    }

}