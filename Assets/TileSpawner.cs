using UnityEngine;



public class ChessBoardSpawner : MonoBehaviour
{
    [SerializeField] private GameObject Tile; 
    

    [SerializeField] private int boardSize = 8; // Chessboard is 8x8
    [SerializeField] private float squareSize = 1.0f; // Size of each square side

    private void Start()
    {
        SpawnChessBoard();
    }

    private void SpawnChessBoard()
    {
        // Calculate the offset to center the board at the origin
        float offset = (boardSize - 1) * squareSize / 2;

        for (int i = 0; i < boardSize; i++)
        {
            // Determine the square color based on the row
            PlayerNumber setPlayerTile = i < boardSize / 2 ? PlayerNumber.PlayerOne : PlayerNumber.PlayerTwo;

            for (int j = 0; j < boardSize; j++)
            {
                // Calculate the position of the square
                Vector3 position = new Vector3(i * squareSize - offset, 0, j * squareSize - offset);

                // Instantiate the square at the calculated position and with no rotation
                GameObject spannedTile = Instantiate(Tile, position, Quaternion.identity, transform);
                spannedTile.GetComponent<ToggleTile>().SetPlayer(setPlayerTile);
            }
        }
    }

    
}
