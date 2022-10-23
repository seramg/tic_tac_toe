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
}
