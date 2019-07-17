//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//public class test : MonoBehaviour {

//    public float speed;
//    public GameObject unclear;

//	void Start () {
//        //Vector3 GetComponent< Rigidbody > ().angularVelocity;

//    }

//	void Update () {
//        //Vector3 rd = new Vector3(Random.Range(0f, 10f), Random.Range(0f, 10f), 0f);
//        transform.RotateAround(unclear.transform.localPosition, new Vector3(0f,1f,0f),speed*Time.deltaTime);
//        //gameObject.GetComponent<Rigidbody>().transform.rotation = Random.rotation;

//    }
//}
using UnityEngine;
using System.Collections;

public class test : MonoBehaviour
{

    public Transform sun;

    public float r; //半径
    public float w; //角度
    public float speed = 2;

    public float x;
    public float y;
    public float z;


    void Start()
    {
        GameObject sun = GameObject.FindGameObjectWithTag("sun"); //取得圆点 我用一个sphere 表示
        r = Vector3.Distance(transform.position, sun.transform.position); //两个物品间的距离
    }

    void Update()
    {

        //下面的概念有点模糊了
        w += speed * Time.deltaTime; // 

        x = Mathf.Cos(w) * r;
       z = -(Mathf.Sin(w) * r);

        transform.position = new Vector3(x, transform.position.y, z);


    }



}
