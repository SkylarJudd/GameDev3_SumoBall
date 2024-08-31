using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrintDegrees : MonoBehaviour
{
    public GameObject copy;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        print(gameObject.transform.rotation.y);
        float y = gameObject.transform.rotation.y;
        print(y);


        Vector3 newRotation = new Vector3(copy.transform.eulerAngles.x, y, copy.transform.eulerAngles.z);
        copy.transform.eulerAngles = newRotation;
    }
}
