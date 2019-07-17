using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class InteractTest3 : MonoBehaviour
{

    private Animator animator;

    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            animator = col.gameObject.GetComponent<Animator>();
            animator.SetBool("Move1", true);
            StartCoroutine(DelayToInvoke.DelayToInvokeDo(() =>
            {
                animator.SetBool("Move1", false);
            }, 1f));
               StartCoroutine(DelayToInvoke.DelayToInvokeDo(() => {
            col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);

               }, 1.5f));
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
        }
    }

    void OnTriggerStay(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            {
                 StartCoroutine(DelayToInvoke.DelayToInvokeDo(() => {
                col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);

                transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
                gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);

                       }, 1.5f));
            }
        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
            transform.localScale = new Vector3(0.001f, 0.001f, 0.001f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(1000f, 1000f, 1000f);
        }
    }


    void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag.CompareTo("Atom1") == 0)
        {
            animator = col.gameObject.GetComponent<Animator>();
            animator.SetBool("Move2", true);
            StartCoroutine(DelayToInvoke.DelayToInvokeDo(() =>
            {
                animator.SetBool("Move2", false);
            }, 1f));

                {
                 StartCoroutine(DelayToInvoke.DelayToInvokeDo(() => {
                col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
                transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);

                  }, 1.5f));
            }

        }
        else if (col.gameObject.tag.CompareTo("Atom3") == 0)
        {
            col.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
            col.gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
            transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
            gameObject.GetComponent<BoxCollider>().size = new Vector3(10f, 10f, 10f);
        }
    }
}