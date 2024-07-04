using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class followGameObject : MonoBehaviour
{
    [SerializeField] GameObject followObject;
    void Update()
    {
        transform.position = followObject.transform.position;
    }
}
