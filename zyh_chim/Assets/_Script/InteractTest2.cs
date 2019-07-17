using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractTest2 : MonoBehaviour
{
    public Camera mainCrma;

    private RaycastHit objhit;

    private Ray _ray;


    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            if (Interaction1.move1 == true)
            {

                transform.Find("ModelObject").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos1").gameObject.SetActive(true);
            }
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            if (Interaction2.move2 == true)
            {
                transform.Find("ModelObject").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos2").gameObject.SetActive(true);

            }
        }
        if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
        {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(true);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(false);
        }
        else
        {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(false);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(true);
        }
    }

    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0 )
        {
            if (Interaction1.move1 == true)
            {

                transform.Find("ModelObject").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos1").gameObject.SetActive(true);

            }
        }
       else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            if (Interaction2.move2 == true)
            {
                transform.Find("ModelObject").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos2").gameObject.SetActive(true);

            }
        }
        if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
        {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(true);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(false);
        }
        else
        {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(false);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(true);
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0 )
        {
            if (Interaction1.move1 == false || Interaction2.move2 ==false)
                transform.Find("ModelObject").localScale = new Vector3(0.01f, 0.01f, 0.01f);
                transform.Find("H Pos1").gameObject.SetActive(false);
        }
       else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            if (Interaction2.move2 == false || Interaction1.move1 ==false)
                transform.Find("ModelObject").localScale = new Vector3(0.01f, 0.01f, 0.01f);
                transform.Find("H Pos2").gameObject.SetActive(false);

        }
        if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
        {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(true);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(false);
        }
        else {
            gameObject.transform.Find("Text_1/H2O_Text").gameObject.SetActive(false);
            gameObject.transform.Find("Text_2/OxygenText").gameObject.SetActive(true);
        }
    }

    //实现靠近屏幕变成水滴
    void Update()
    {
        if (transform.Find("H Pos2").gameObject.activeSelf && transform.Find("H Pos1").gameObject.activeSelf)
        {
            _ray = mainCrma.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));

            Debug.DrawLine(_ray.origin, objhit.point, Color.red, 2);

            if (Physics.Raycast(_ray, out objhit, 15))
            {
                Debug.Log("射线碰撞到碰撞体");

                GameObject gameObj = objhit.collider.gameObject;

                if (gameObj.tag == "H2O")
                {
                    Debug.Log("射线碰撞到碰撞体"+gameObj.tag);
                    transform.Find("ModelObject").localScale = new Vector3(0.01f, 0.01f, 0.01f);
                    transform.Find("H Pos2").localScale = new Vector3(0.01f, 0.01f, 0.01f);
                    transform.Find("H Pos1").localScale = new Vector3(0.01f, 0.01f, 0.01f);
                    transform.Find("Water").gameObject.SetActive(true);
                }
            }
            else
            {
                Debug.Log("射线没有碰撞到碰撞体");
                transform.Find("ModelObject").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos2").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("H Pos1").localScale = new Vector3(1f, 1f, 1f);
                transform.Find("Water").gameObject.SetActive(false);
            }
        }
    }
}