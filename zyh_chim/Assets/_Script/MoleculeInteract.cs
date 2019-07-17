using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//两原子组成
public class MoleculeInteract : MonoBehaviour
{
    public string colName;//碰撞物体的名字
    public string moleName;//分子模型的名字
    public GameObject moleModel;//分子模型的物体
    public GameObject moleText;//分子模型的信息卡片
    public GameObject phyModel;//分子的实物模型

    public Camera mainCrma;

    private RaycastHit objhit;

    private Ray _ray;
    private int rayLength = 15;

    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.name.CompareTo(colName) == 0)
        {
            if (UpdateMove.move == true)
            {

                moleModel.SetActive(true);//分子模型 显示
                moleText.SetActive(true);
            }
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.name.CompareTo(colName) == 0)
        {
            moleModel.SetActive(false);//分子缩小
            moleText.SetActive(false);
        }
    }

    //实现靠近屏幕变成水滴
    void Update()
    {
       // if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
       if(moleText.activeSelf)//若分子信息 显示
        {
            _ray = mainCrma.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));

            Debug.DrawLine(_ray.origin, objhit.point, Color.red, 2);

            if (Physics.Raycast(_ray, out objhit, rayLength))
            {
                Debug.Log("射线碰撞到碰撞体");

                GameObject gameObj = objhit.collider.gameObject;

                if (gameObj.name.CompareTo(moleName) ==0)
                {
                    Debug.Log("射线碰撞到碰撞体 " + gameObj.name);
                    moleModel.SetActive(false);
                    phyModel.transform.gameObject.SetActive(true);
                }
            }
            else
            {
                Debug.Log("射线没有碰撞到碰撞体");
                moleModel.SetActive(true);
                phyModel.transform.gameObject.SetActive(false);
            }
        }
    }
}