import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final AudioCache player = new AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded tuts({color, soundNum}) {
    return Expanded(
      child: Container(
        width: 150.0,
        height: 50.0,
        color: color,
        child: TextButton(
          onPressed: () {
            playSound(soundNum);
          },
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xlophone App',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              tuts(color: Colors.red, soundNum: 1),
              tuts(color: Colors.green, soundNum: 2),
              tuts(color: Colors.tealAccent, soundNum: 3),
              tuts(color: Colors.orange, soundNum: 4),
              tuts(color: Colors.lightBlue, soundNum: 5),
              tuts(color: Colors.pinkAccent, soundNum: 6),
              tuts(color: Colors.cyanAccent, soundNum: 7),
            ],
          ),
        ),
      ),
    );
  }
}
