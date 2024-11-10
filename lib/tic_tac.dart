import 'package:flutter/material.dart';

class tic_tac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> sarfuce = List.filled(9, '');
  String currentPlayer = 'X';
  String win = '';


  bool _checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      if (sarfuce[combination[0]] != '' &&
          sarfuce[combination[0]] == sarfuce[combination[1]] &&
          sarfuce[combination[0]] == sarfuce[combination[2]]) {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Center(child: Text('Tic Tac Toe',
      style:  TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.orange,
      ),))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            ),
            itemCount: 9,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      sarfuce[index],
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          if (win != '')
            Text(
              'Player $win wins!',
              style: TextStyle(fontSize: 24),
            ),
          SizedBox(height: 20),
             Text('Reset Game'),
        ],
      ),
    );
  }
}