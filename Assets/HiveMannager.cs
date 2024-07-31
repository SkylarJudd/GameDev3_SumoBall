using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HiveMannager : GameBehaviour
{
    [SerializeField]
    List<EquationSpawnPoints> equationSpawnPoints = new List<EquationSpawnPoints>();
    [SerializeField]
    List<Color> colours = new List<Color>();


    public enum Difficulty { EASY, MEDIUM, HARD }
    public Difficulty difficulty;
    public int numberOne;
    public int numberTwo;
    public int correctAnswer;
    private string operatorSign = "";
    private MathsSign mathsSign;

    void Start()
    {
        populateQuestions();
        _GM.scoreToWin = equationSpawnPoints.Count;
    }


    public void populateQuestions()
    {
        foreach (EquationSpawnPoints _ESP in equationSpawnPoints)
        {
            print("Loop");
            GenerateRandomEquation();
            _ESP.number1Text.text = numberOne.ToString();
            _ESP.number2Text.text = numberTwo.ToString();
            _ESP.number3Text.text = correctAnswer.ToString();
            _ESP.requiredSign = mathsSign;
            _ESP.sign1Text.text = "?";

            SetColour(_ESP);
        }
    }

    void SetColour(EquationSpawnPoints _ESP)
    {
        int rng = Random.Range(0, colours.Count);
        _ESP.number1Text.faceColor = colours[rng];
        _ESP.number2Text.faceColor = colours[rng];
        _ESP.number3Text.faceColor = colours[rng];
        _ESP.sign1Text.faceColor = colours[rng];
        _ESP.equlesText.faceColor = colours[rng];
    }

    private void GenerateRandomEquation()
    {
        int rnd = Random.Range(1, 100);
        if (rnd <= 25)
            GenerateAddition();
        else if (rnd <= 50)
            GenerateSubtraction();
        else if (rnd <= 75)
            GenerateMultiplication();
        else
            GenerateDivision();
    }

    private void GenerateMultiplication()
    {
        operatorSign = " x ";
        mathsSign = MathsSign.Times;
        numberOne = GetRandomNumber();
        numberTwo = GetRandomNumber();
        correctAnswer = numberOne * numberTwo;
        Debug.Log(numberOne + operatorSign + numberTwo + " = " + correctAnswer);
    }

    private void GenerateAddition()
    {
        operatorSign = " + ";
        mathsSign = MathsSign.Plus;
        numberOne = GetRandomNumber();
        numberTwo = GetRandomNumber();
        correctAnswer = numberOne + numberTwo;
        Debug.Log(numberOne + operatorSign + numberTwo + " = " + correctAnswer);
    }

    private void GenerateSubtraction()
    {
        operatorSign = " - ";
        mathsSign = MathsSign.Minis;
        numberOne = GetRandomNumber();
        numberTwo = GetRandomNumber();
        correctAnswer = numberOne - numberTwo;
        Debug.Log(numberOne + operatorSign + numberTwo + " = " + correctAnswer);
    }

    private void GenerateDivision()
    {
        operatorSign = " / ";
        mathsSign = MathsSign.Devide;

        numberTwo = GetRandomNumber();
        while (numberTwo == 0)
        {
            numberTwo = GetRandomNumber();
        }

        int multiplier = GetRandomNumber();
        numberOne = numberTwo * multiplier;

        correctAnswer = Mathf.RoundToInt(numberOne / numberTwo);

        Debug.Log(numberOne + operatorSign + numberTwo + " = " + correctAnswer);
    }

    private int GetRandomNumber()
    {
        switch (difficulty)
        {
            case Difficulty.EASY:
                return (Random.Range(1, 10));
            case Difficulty.MEDIUM:
                return (Random.Range(1, 20));
            case Difficulty.HARD:
                return (Random.Range(1, 100));
            default:
                return (Random.Range(1, 10));
        }
    }
}
