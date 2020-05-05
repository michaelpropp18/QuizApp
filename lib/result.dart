import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  Result(this.score, this.reset);

  String get getPhrase {
    if (score == 1) {
      return "You got $score question correct!";
    } else {
      return "You got $score questions correct!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Text(getPhrase,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        FlatButton(child: Text('Restart quiz!'), textColor: Colors.blue, onPressed: reset)
      ],
    );
  }
}
