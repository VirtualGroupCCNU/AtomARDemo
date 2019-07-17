using UnityEngine;
using Vuforia;
using System.Collections;
public class MyTrackableEventHandler : MonoBehaviour,
                      ITrackableEventHandler
{
    #region PRIVATE_MEMBER_VARIABLES


    private TrackableBehaviour myTrackableBehaviour;
    public Transform sphere;


    #endregion // PRIVATE_MEMBER_VARIABLES






    #region UNTIY_MONOBEHAVIOUR_METHODS


    void Start()
    {
        myTrackableBehaviour = GetComponent<TrackableBehaviour>();
        if (myTrackableBehaviour)
        {
            myTrackableBehaviour.RegisterTrackableEventHandler(this);
        }
    }


    #endregion // UNTIY_MONOBEHAVIOUR_METHODS






    #region PUBLIC_METHODS


    /// <summary>
    /// Implementation of the ITrackableEventHandler function called when the
    /// tracking state changes.
    /// </summary>
    public void OnTrackableStateChanged(
                  TrackableBehaviour.Status previousStatus,
                  TrackableBehaviour.Status newStatus)
    {
        if (newStatus == TrackableBehaviour.Status.DETECTED ||
          newStatus == TrackableBehaviour.Status.TRACKED ||
          newStatus == TrackableBehaviour.Status.EXTENDED_TRACKED)
        {
            OnTrackingFound();
            StopAllCoroutines();//关闭所有协同程序
            StartCoroutine(MoveUp());//开启特定的协同程序
        }
        else
        {
            OnTrackingLost();
        }
    }


    #endregion // PUBLIC_METHODS


    //sphere上升控制
    IEnumerator MoveUp()
    {
        sphere.transform.localPosition = new Vector3(0, -2, 0);
        while (sphere.transform.localPosition != Vector3.zero)
        {
            yield return new WaitForEndOfFrame();
            sphere.transform.localPosition = Vector3.MoveTowards(sphere.transform.localPosition, Vector3.zero, 1f * Time.deltaTime);
        }
    }


    #region PRIVATE_METHODS




    private void OnTrackingFound()
    {
        Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
        Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);


        // Enable rendering:
        foreach (Renderer component in rendererComponents)
        {
            component.enabled = true;
        }


        // Enable colliders:
        foreach (Collider component in colliderComponents)
        {
            component.enabled = true;
        }


        Debug.Log("Trackable " + myTrackableBehaviour.TrackableName + " found");
    }




    private void OnTrackingLost()
    {
        Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
        Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);


        // Disable rendering:
        foreach (Renderer component in rendererComponents)
        {
            component.enabled = false;
        }


        // Disable colliders:
        foreach (Collider component in colliderComponents)
        {
            component.enabled = false;
        }


        Debug.Log("Trackable " + myTrackableBehaviour.TrackableName + " lost");
    }


    #endregion // PRIVATE_METHODS
}