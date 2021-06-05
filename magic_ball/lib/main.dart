import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ballNum = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Ball',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Text('ASK ME ANYTHING'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                ballNum = Random().nextInt(5) + 1;
                print('ball has pressed :: $ballNum');
              });
            },
            child: Image.asset('images/ball$ballNum.png'),
          ),
        ),
      ),
    );
  }
}
