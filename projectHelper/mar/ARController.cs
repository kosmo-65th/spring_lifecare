using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using GoogleARCore;

#if UNITY_EDITOR
using input = GoogleARCore.InstantPreviewInput;
#endif

public class ARController : MonoBehaviour
{
    //We wil fill this list with the planes that ARCore detected in the current frame
    private List<DetectedPlane> m_NewDetectedPlanes = new List<DetectedPlane>();

    public GameObject GridPrefab;

    public GameObject portal;

    public GameObject ARCamera;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        //Check ARCore session status
        if (Session.Status != SessionStatus.Tracking)
        {
            return;
        }

        //The follwing function will fill m_NewTrackedPlanes with the planes that ARCore detected in the current fame
        Session.GetTrackables<DetectedPlane>(m_NewDetectedPlanes, TrackableQueryFilter.New);

        //Instantiate a Grid for each TackedPlane in m_NewTrackedPlanes
        for (int i = 0; i < m_NewDetectedPlanes.Count; i++)
        {
            GameObject grid = Instantiate(GridPrefab, Vector3.zero, Quaternion.identity, transform);

            //This function will set the position of grid and modify the vertices of the attached mesh
            grid.GetComponent<GridVisualiser>().Initialize((DetectedPlane)m_NewDetectedPlanes[i]);

        }


        //CHeck if th usede touched the screen
        Touch touch;
        if (Input.touchCount < 1 || (touch = Input.GetTouch(0)).phase != TouchPhase.Began)
        {
            return;
        }

        //Let's noe check if the user touched any of the teacked planes
        TrackableHit hit;
        if (Frame.Raycast(touch.position.x, touch.position.y, TrackableHitFlags.PlaneWithinPolygon, out hit))
        {
            //Let's now place the portal top of the tracked plane that we touched

            //Enable the portal
            portal.SetActive(true);

            //Create a new Anchor

            Anchor anchor = hit.Trackable.CreateAnchor(hit.Pose);

            //Set the position of the portal to be the same as the hit position
            portal.transform.position = hit.Pose.position;
            portal.transform.rotation = hit.Pose.rotation;

            //We want the portal to face the camara
            Vector3 cameraPosition = ARCamera.transform.position;

            //The portal shoud onlt rotate arount the Y axis
            cameraPosition.y = hit.Pose.position.y;

            //Rotate the portal to face the camara
            portal.transform.LookAt(cameraPosition, portal.transform.up);

            //ARCore will keep understading the world and update the archors accordingly hence we need to attach out portal to the anchor
            portal.transform.parent = anchor.transform;
        }
    }
}