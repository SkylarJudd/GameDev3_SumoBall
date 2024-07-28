using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class EquationSpawnPoints : GameBehaviour
{
    public Transform number1Transform;
    public Transform signTransform;
    public Transform number2Transform;
    public Transform equlesTransform;
    public Transform number3Transform;

    public TMP_Text number1Text;
    public TMP_Text sign1Text;
    public TMP_Text number2Text;
    public TMP_Text equlesText;
    public TMP_Text number3Text;

    public MathsSign requiredSign;

    private void OnTriggerEnter(Collider other)
    {
        if (other.GetComponent<MathsPickupLogic>() != null)
        {
            if (other.GetComponent<MathsPickupLogic>().mathsSign == requiredSign)
            {
                CorrectItemAdded(other.gameObject);
            }
            {
                IncorrectItemAdded(other.gameObject);
            }
        }
    }

    void CorrectItemAdded(GameObject GO)
    {
        print("CorrectItem");
        HideAllSigns();
        _GM.UpdateScore();
        GameEvents.PlayerDeliverSignAccepted(GO);
        
    }
    void IncorrectItemAdded(GameObject GO)
    {
        print("IncorrectItem");
    }

    void HideAllSigns()
    {
        number1Text.gameObject.SetActive(false);
        sign1Text.gameObject.SetActive(false);
        number2Text.gameObject.SetActive(false);
        equlesText.gameObject.SetActive(false);
        number3Text.gameObject.SetActive(false);
        gameObject.GetComponent<Collider>().enabled = false;
    }
}
