using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CircleLine : MonoBehaviour
{

    public LineRenderer LR;
    public int n;
    public float r;
    public float y;

    void Start()
    {
        LR = this.GetComponent<LineRenderer>();//得到组件
        LR.SetVertexCount(n + 1);//设置线的段数

        float x;
        float z;

        //循环着取出36个点
        for (int i = 0; i < n + 1; i++)
        {
            x = Mathf.Sin((360f * i / n) * Mathf.Deg2Rad) * r;//横坐标
            z = Mathf.Cos((360f * i / n) * Mathf.Deg2Rad) * r;//纵坐标

            LR.SetPosition(i, new Vector3(x, y, z));
        }
    }
}
