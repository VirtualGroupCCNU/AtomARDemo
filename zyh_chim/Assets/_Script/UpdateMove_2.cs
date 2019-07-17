using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpdateMove_2 : MonoBehaviour {

    public Transform startPos;
    public GameObject model;
    public float oriScale = 0.5f;
    public static bool bodyAlone = true;
    public static bool move2 = false;

    //平时 原子一直趋于原点
    void Update () {
        //原子往原点（0，0，0）运动；
        Vector3 posStart = startPos.position;
        GameObject mod1 = model;

        if (bodyAlone == true)//未碰撞
        {
            mod1.transform.localScale = new Vector3(oriScale, oriScale, oriScale);
            //原先原子大小为1，现在改为0.5；
            mod1.transform.position = Vector3.MoveTowards(mod1.transform.position, posStart, 10f * Time.deltaTime);
            if (Vector3.Distance(posStart, mod1.transform.position) < 0.05f)
            {
                move2 = false;// 本原子 未组成，在起点
            }
        }
    }
}
