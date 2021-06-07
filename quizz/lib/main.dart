import 'package:flutter/material.dart';

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

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Microsoft didirikan oleh Bill Gates',
    'Python adalah bahasa pemrograman Compiled',
    'Pyton adalah bahasa pemrograman yang baik digunakan dalam Machine Learning',
    'Bahasa pemrograman C++ mensupport paradigma Object Oriented Programming',
    'Javasript adalah bahasa pemrograman static'
  ];
  List<bool> answer = [
    true,
    false,
    true,
    true,
    false,
  ];

  int questionIndex = 0;

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
                questions[questionIndex],
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
                bool trueAnswer = answer[questionIndex];
                if (trueAnswer == true) {
                  print('Anda benar');
                } else {
                  print('Anda salah');
                }

                setState(() {
                  if (questionIndex == questions.length - 1) {
                    questionIndex = questions.length;
                  } else {
                    questionIndex++;
                  }
                });
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
                bool trueAnswer = answer[questionIndex];
                if (trueAnswer == false) {
                  print('Anda benar');
                } else {
                  print('Anda salah');
                }
                setState(() {
                  if (questionIndex == questions.length - 1) {
                    questionIndex = questions.length - 1;
                    print(questionIndex);
                  } else {
                    questionIndex++;
                  }
                });
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
