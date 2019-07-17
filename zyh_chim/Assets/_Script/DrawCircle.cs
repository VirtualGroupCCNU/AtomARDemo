using UnityEngine;
using System;
using System.Collections.Generic;

public class DrawCircle : MonoBehaviour
{
    public Transform cub;
    public Transform m_Transform;
    public float m_Radius = 1; // 圆环的半径
    public float m_Theta = 0.1f; // 值越低圆环越平滑
    public Color m_Color = Color.green; // 线框颜色
    System.Random random = new System.Random(1000);
    void Start()
    {
        if (m_Transform == null)
        {
            throw new Exception("Transform is NULL.");
        }
        GetDrawCircle();
    }
    void GetDrawCircle()
    {
        List<Vector3> list = GetCircle();
        for (int i = 0; i < list.Count; i++)
        {
            Transform go = Instantiate<Transform>(cub);
            go.SetParent(transform);//创建父对象
            go.localPosition = list[i];
        }

    }

    void OnDrawGizmos()
    {
        if (m_Transform == null) return;
        if (m_Theta < 0.0001f) m_Theta = 0.0001f;

        // 设置矩阵
        Matrix4x4 defaultMatrix = Gizmos.matrix;
        Gizmos.matrix = m_Transform.localToWorldMatrix;

        // 设置颜色
        Color defaultColor = Gizmos.color;
        Gizmos.color = m_Color;

        // 绘制圆环
        Vector3 beginPoint = Vector3.zero;
        Vector3 firstPoint = Vector3.zero;
        for (float theta = 0; theta <= 2 * Mathf.PI; theta += m_Theta)
        {
            float x = m_Radius * Mathf.Cos(theta);
            float z = m_Radius * Mathf.Sin(theta);
            Vector3 endPoint = new Vector3(x, 0, z);
            if (theta == 0)
            {
                firstPoint = endPoint;
            }
            else
            {
                Gizmos.DrawLine(beginPoint, endPoint);
            }
            beginPoint = endPoint;
        }

        // 绘制最后一条线段
        Gizmos.DrawLine(firstPoint, beginPoint);

        // 恢复默认颜色
        Gizmos.color = defaultColor;

        // 恢复默认矩阵
        Gizmos.matrix = defaultMatrix;
    }

    //private Vector2 GetRandomPoint(Vector2 point)
    //{
    //    Vector3[] list = GetCircle().ToArray();
    //    random = new System.Random(1000);
    //    int index = random.Next(0, list.Length);
    //    Vector3 v = list[index] + new Vector3(point.x, 0, point.y);
    //    return v;
    //}
    private List<Vector3> GetCircle()
    {
        List<Vector3> list = new List<Vector3>();
        for (float theta = 0; theta <= 2 * Mathf.PI; theta += m_Theta)
        {
            float x = m_Radius * Mathf.Cos(theta);
            float z = m_Radius * Mathf.Sin(theta);
            Vector3 endPoint = new Vector3(x, 0, z);
            list.Add(endPoint);
        }
        return list;
    }
}
