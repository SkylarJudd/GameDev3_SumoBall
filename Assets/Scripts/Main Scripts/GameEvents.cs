using System;
using UnityEngine;


public static class GameEvents
{
    #region ("Exsample of adding action")
    public static event Action<GameObject> OnGameEventExsample = null;
    #endregion

    public static event Action<GameObject> OnPlayerDeliverSignAccepted = null;
    public static event Action<GameObject> OnPlayerWin = null;



    #region ("Exsample of adding action")
    public static void GameEventExsample(GameObject go)
    {
        OnGameEventExsample?.Invoke(go);
    }
    #endregion

    public static void PlayerDeliverSignAccepted(GameObject go)
    {
        OnPlayerDeliverSignAccepted?.Invoke(go);
    }

    public static void PlayerWin(GameObject go)
    {
        OnPlayerWin?.Invoke(go);
    }
}
