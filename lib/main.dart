import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  static const String turn = 'X';
  @override
  Widget build(BuildContext context) {
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
              fontSize: 75
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            
          )
        ],
      ),
    );
  }
}
