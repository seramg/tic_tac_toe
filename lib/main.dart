import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/theme/color.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TicTac(),
    );
  }
}

class TicTac extends StatefulWidget {
  const TicTac({Key? key}) : super(key: key);

  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  static  String turn = 'X';

  Game game = Game();
  bool gameover= false;

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        //center align for the board
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'IT\'S $turn TURN'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 55,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardlength ~/ 3,
              //~ operator divides to integer and returns int value
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardlength, (index) {
                return GestureDetector(
                  onTap: gameover?null:(){
                    if(game.board![index]=="") {
                            setState(() {
                              game.board![index] = turn;
                              if (turn == 'X') {
                                turn = "O";
                              } else {
                                turn = "X";
                              }
                            });
                          }

                    },
                  child: Container(
                    width: Game.squaresize,
                    height: Game.squaresize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                        child: Text(
                      game.board![index],
                      style: TextStyle(
                          color: game.board![index] == 'X'
                              ? MainColor.xcolor
                              : MainColor.ocolor,
                          fontSize:64.0,)
                    )),
                  ),
                  
                );
              }),
            ),
          ),

        ],
      ),
    );
  }
}
