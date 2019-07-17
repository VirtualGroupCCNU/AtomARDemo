using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test2 : MonoBehaviour
{

    public float speed;
    public float r = 1;
    public float m_Theta = 0.1f;
    public Color m_Color = Color.red;
    private int i;
    private List<Vector3> list;


    void Start()
    {
        i = 0;
        if (m_Theta < 0.02f) m_Theta = 0.02f;
    }

    //void OnDrawGizmos()
    //{
    //    if (m_Transform == null) return;
    //    if (m_Theta < 0.0001f) m_Theta = 0.0001f;

    //    // 设置矩阵
    //    Matrix4x4 defaultMatrix = Gizmos.matrix;
    //    Gizmos.matrix = m_Transform.localToWorldMatrix;

    //    // 设置颜色
    //    Color defaultColor = Gizmos.color;
    //    Gizmos.color = m_Color;

    //    // 绘制圆环
    //    Vector3 beginPoint = Vector3.zero;
    //    Vector3 firstPoint = Vector3.zero;
    //    for (float theta = 0; theta <= 2 * Mathf.PI; theta += m_Theta)
    //    {
    //        float x = r * Mathf.Cos(theta);
    //        float z = r * Mathf.Sin(theta);
    //        Vector3 endPoint = new Vector3(x, 0, z);
    //        if (theta == 0)
    //        {
    //            firstPoint = endPoint;
    //        }
    //        else
    //        {
    //            Gizmos.DrawLine(beginPoint, endPoint);
    //        }
    //        beginPoint = endPoint;
    //    }

    //    // 绘制最后一条线段
    //    Gizmos.DrawLine(firstPoint, beginPoint);

    //    // 恢复默认颜色
    //    Gizmos.color = defaultColor;

    //    // 恢复默认矩阵
    //    Gizmos.matrix = defaultMatrix;
    //}

    void Update()
    {
        MoveTo();
    }

    void MoveTo()
    {
        List<Vector3> list = GetCircle();
        gameObject.transform.localPosition = Vector3.MoveTowards(list[i], list[i+1], Time.deltaTime * speed);

        if (Vector3.Distance(list[i], transform.localPosition) < 0.01f)
        {
            i++;
            if ( i+1 > list.Count -1)
            {
                i = 0;
                transform.localPosition = list[i];
            }
        }
    }
    private List<Vector3> GetCircle()
    {
        List<Vector3> list = new List<Vector3>();
        for (float theta = 0; theta <= 2 * Mathf.PI; theta += m_Theta)
        {
            float x = r * Mathf.Cos(theta);
            float z = r * Mathf.Sin(theta);
            Vector3 endPoint = new Vector3(x, 0, -z);
            list.Add(endPoint);
        }
        return list;
    }
}

