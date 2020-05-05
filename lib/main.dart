import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '2 + 2 = ?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '5', 'score': 0},
      ]
    },
    {
      'questionText': 'What color is the sky?',
      'answers': [
        {'text': 'Green', 'score': 0},
        {'text': 'Red', 'score': 0},
        {'text': 'Blue', 'score': 1},
        {'text': 'Orange', 'score': 0}
      ]
    },
    {
      'questionText': 'Select a reptile.',
      'answers': [
        {'text': 'Lizard', 'score': 1},
        {'text': 'Bear', 'score': 0},
        {'text': 'Dog', 'score': 0},
        {'text': 'Fish', 'score': 0}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex++);
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Quiz App")),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
