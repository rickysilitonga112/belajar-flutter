import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart'; // flutter alert
import 'QuizzBrain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

QuizzBrain quizzBrain = QuizzBrain();

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scoreKeeper = [];
  int trueAns = 0;
  void checkAnswer(bool userAnswer) {
    bool trueAnswer = quizzBrain.getQuizzAnswer();
    if (quizzBrain.next() == true) {
      setState(() {
        if (trueAnswer == userAnswer) {
          trueAns++;
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        print(trueAns);
        quizzBrain.nextQuestion();
      });
    } else {
      Alert(
              context: context,
              title: "Kuis Selesai",
              desc: "Anda menjawab $trueAns pertanyaan dengan benar")
          .show();

      setState(() {
        if (quizzBrain.finish() == true) {
          quizzBrain.resetQuestionIndex();
          scoreKeeper.clear();
          quizzBrain.setNext();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuizzQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          // true button
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          // false button
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
