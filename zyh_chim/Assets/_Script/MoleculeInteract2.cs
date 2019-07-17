using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//三原子组成&分子组成
public class MoleculeInteract2 : MonoBehaviour
{
    public string colName1;//碰撞物体的名字1号
    public string colName2;//碰撞物体的名字2号

    public string moleName;//分子模型的名字
    public GameObject moleModel;//分子模型的物体
    public GameObject phyModel;//分子的实物模型

    public GameObject moleText;//分子的信息卡片
    public GameObject atomText;//原子的信息卡片

    public GameObject partAtom1;//组成原子1号
    public GameObject partAtom2;//组成原子2号

    public Camera mainCrma;

    private RaycastHit objhit;

    private Ray _ray;
    private int rayLength = 15;


    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.name.CompareTo(colName1) == 0)
        {
            if (UpdateMove.move == true)
            {

                moleModel.SetActive(true);//分子模型 显示
                partAtom1.SetActive(true);//组成原子1 显示
            }
        }
        else if (col.gameObject.name.CompareTo(colName2) == 0)//碰撞原子2
        {
            if (UpdateMove_2.move2 == true)//原子2 是否组合
            {
                moleModel.SetActive(true);
                partAtom2.SetActive(true);//组成原子2 显示
            }
        }
        if (partAtom1.activeSelf && partAtom2.activeSelf)//信息卡片的出现
        {
            moleText.SetActive(true);
            atomText.SetActive(false);
        }
        else
        {
            moleText.SetActive(false);
            atomText.SetActive(true);
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.name.CompareTo(colName1) == 0)
        {
            if (UpdateMove.move == false || UpdateMove_2.move2 == false)
            moleModel.SetActive(false);//分子隐藏
            partAtom1.SetActive(false);
        }
        else if (col.gameObject.name.CompareTo(colName2) == 0)
        {
            if (UpdateMove.move == false || UpdateMove_2.move2 == false)
            moleModel.SetActive(false);//分子隐藏
            partAtom2.SetActive(false);

        }
        if (partAtom1.activeSelf && partAtom2.activeSelf)
        {
            moleText.SetActive(true);
            atomText.SetActive(false);
        }
        else
        {
            moleText.SetActive(false);
            atomText.SetActive(true);
        }
    }

    //实现靠近屏幕变成水滴
    void Update()
    {
        // if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
        if (partAtom1.activeSelf && partAtom2.activeSelf)
        {
            _ray = mainCrma.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));

            Debug.DrawLine(_ray.origin, objhit.point, Color.red, 2);

            if (Physics.Raycast(_ray, out objhit, rayLength))
            {
                Debug.Log("射线碰撞到碰撞体");

                GameObject gameObj = objhit.collider.gameObject;

                if (gameObj.name.CompareTo(moleName) == 0)
                {
                    Debug.Log("射线碰撞到碰撞体 " + gameObj.name);
                    moleModel.SetActive(false);
                    partAtom1.transform.localScale = new Vector3(0.001f,0.001f,0.001f);
                    partAtom2.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);

                    phyModel.SetActive(true);
                }
            }
            else
            {
                Debug.Log("射线没有碰撞到碰撞体");
                moleModel.SetActive(true);
                partAtom1.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                partAtom2.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);

                phyModel.SetActive(false);
            }
        }
    }
}