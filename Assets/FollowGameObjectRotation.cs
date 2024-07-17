using UnityEngine;

public class LookAtTarget : MonoBehaviour
{
    [SerializeField] Transform target; // Target to look at
 

    void Update()
    {
        LookAt();
    }

    private void LookAt()
    {
        if (target != null)
        {
            transform.rotation = target.rotation;
        }
    }
}
