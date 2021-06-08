import 'Question.dart';

class QuizzBrain {
  int _questionIndex = 0;
  bool _next = true;

  List<Question> _questionBank = [
    Question('Microsoft didirikan oleh Bill Gates', true),
    Question('Python adalah bahasa pemrograman Compiled', false),
    Question(
        'Pyton adalah bahasa pemrograman yang baik digunakan dalam Machine Learning',
        true),
    Question(
        'Bahasa pemrograman C++ mensupport paradigma Object Oriented Programming',
        true),
    Question('Javasript adalah bahasa pemrograman static', false),
  ];

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    } else {
      _next = false;
    }
  }

  void resetQuestionIndex() {
    _questionIndex = 0;
  }

  bool finish() {
    if (_next == false) {
      return true;
    } else {
      return false;
    }
  }

  bool next() {
    return _next;
  }

  void setNext() {
    _next = true;
  }

  String getQuizzQuestion() {
    return _questionBank[_questionIndex].question;
  }

  bool getQuizzAnswer() {
    return _questionBank[_questionIndex].answer;
  }
}
