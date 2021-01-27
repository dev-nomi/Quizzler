import 'Questions.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain{
  int _questionNumber = 0;
  int correct=0;
  int wrong=0;
  List<Icon> scoreKeeper = []; //creates an empty list of icons
  List<Questions> _questionsBank = [
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions('No piece of square dry paper can be folded in half more than 7 times.', false),
    Questions('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Questions('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Questions('The total surface area of two human lungs is approximately 70 square metres.', true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Questions('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];
  String getQuestionText(){
    return _questionsBank[_questionNumber].questionText;
  }//getQuestionText
  bool getQuestionAnswer(){
    return _questionsBank[_questionNumber].questionAnswer;
  }//getQuestionAnswer
  void nextQuestion(BuildContext context){
    if(_questionNumber<_questionsBank.length-1){
      _questionNumber++;
    }
    else if(_questionNumber==_questionsBank.length-1){
      Alert(context: context, title: "Game Over", desc: "Correct:$correct  Wrong:$wrong").show();
      _questionNumber=0;
      this.scoreKeeper.clear();
    }
  }
  void checkAnswer(bool buttonValue) {
    bool correctAnswer=getQuestionAnswer();
    if (correctAnswer == buttonValue) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      correct++;
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
      wrong++;
    }
  } //checkAnswer

}//QuizBrain