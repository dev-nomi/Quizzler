import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain =QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Quizzler',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = []; //creates an empty list of icons
  int questionNumber = 0;

  void checkAnswer({bool correctAnswer, bool buttonValue}) {
    if (correctAnswer == buttonValue) {
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
  }//checkAnswer

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionsBank[questionNumber].questionText,
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(
                        correctAnswer: quizBrain.questionsBank[questionNumber].questionAnswer,
                        buttonValue: true
                    );
                    questionNumber++;
                  });
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(
                        correctAnswer: quizBrain.questionsBank[questionNumber].questionAnswer,
                        buttonValue: false
                    );
                    questionNumber++;
                  });
                }),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
