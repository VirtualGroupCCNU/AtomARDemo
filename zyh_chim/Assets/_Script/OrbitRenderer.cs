using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class OrbitRenderer : MonoBehaviour
{

    LineRenderer lr;
    public Transform _transform;

    [Range(3, 36)]
    public int segments;
    public Circle circle;

    void Awake()
    {
        lr = GetComponent<LineRenderer>();
        CalculateEllipse();
    }

    void CalculateEllipse()
    {
        Vector3[] points = new Vector3[segments + 1];
        for (int i = 0; i < segments; i++)
        {
            Vector2 position3D = circle.Evaluate((float)i / (float)segments);
            points[i] = new Vector3(position3D.x, 0f, position3D.y);
        }
        points[segments] = points[0];

        lr.positionCount = segments + 1;
        lr.SetPositions(points);
    }
    void OnValidatet()
    {
        if (Application.isPlaying && lr != null)
            CalculateEllipse();
    }
}