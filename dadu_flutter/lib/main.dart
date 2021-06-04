import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dadu'),
          backgroundColor: Colors.red.shade900,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left_dice_number = 1;
  int right_dice_number = 3;

  // fungsi untuk mengubah nilai dice random
  void randomDice() {
    left_dice_number = Random().nextInt(6) + 1;
    right_dice_number = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
              ),
              child: Image.asset('images/dice$left_dice_number.png'),
              onPressed: () {
                setState(
                  () {
                    randomDice();
                  },
                );
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
              child: Image.asset('images/dice$right_dice_number.png'),
              onPressed: () {
                setState(
                  () {
                    randomDice();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
