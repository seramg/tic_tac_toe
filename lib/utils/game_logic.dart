class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardlength = 9;
  static final squaresize = 100.0;

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardlength, (index) => Player.empty);

  bool winnerCheck(String player,int index, List<int> scoreboard,int gridSize){
    int row= index ~/3;//if he is at [1,1] then 1/3 =0 meaning 0th row
    int col=index %3;// if he is at [1,1] then 1%3= 1 meaning 1st column
    int score= player=="X" ? 1:-1;
    //if 1 its x and if its -1 its o
    scoreboard[row]+=score;
    scoreboard[gridSize+col]+=score;
    if(row==col)//diagonal left
      {
        scoreboard[2*gridSize]+=score;
      }
    if(gridSize-1-col==row)//right diagonal
      {
        scoreboard[2*gridSize+1]+=score;
      }
    if(scoreboard.contains(3)||scoreboard.contains(-3)){
      return true;
    }
    return false;
  }
}
