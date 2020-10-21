using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class touch : MonoBehaviour {


    public string SceneToLoad;

    // Update is called once per frame
    int ClickCount = 0;
    void Update()
    {
        /* press to start 
        if (Input.GetMouseButtonDown(0))
        {
            SceneManager.LoadScene(SceneToLoad);
        }
        */
        if (Application.platform == RuntimePlatform.Android)
        {


            if (Input.GetKeyDown(KeyCode.Escape))
            {
                ClickCount++;
                if (!IsInvoking("DoubleClick"))
                    Invoke("DoubleClick", 1.0f);
                Debug.Log("되라좀1");
            }
            else if (ClickCount == 2)
            {
                CancelInvoke("DoubleClick");
                Application.Quit();
                Debug.Log("되라좀2");
            }
        }

    }

    void DoubleClick()
    {
        ClickCount = 0;
    }

    public void Quit2()
    {
        if (Application.platform == RuntimePlatform.Android)
        {


            if (Input.GetKeyDown(KeyCode.Escape))
            {
                ClickCount++;
                if (!IsInvoking("DoubleClick"))
                    Invoke("DoubleClick", 1.0f);
                Debug.Log("되라좀1");
            }
            else if (ClickCount == 2)
            {
                CancelInvoke("DoubleClick");
                Application.Quit();
                Debug.Log("되라좀2");
            }
        }
    }
}

				
				
		