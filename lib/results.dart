import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultScore;
  //_totalScore will be stored in this property
  final VoidCallback resetHandler;
  //added this a second arugment of the constructor

  Results(this.resultScore, this.resetHandler);

  //getter is a special type of property- a mix of property and method
  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = 'Excellent';
    } else if (resultScore <= 10) {
      resultText = 'Pretty good';
    } else if (resultScore <= 5) {
      resultText = 'Better luck next time';
    } else {
      resultText = 'You suck!';
    }
    return resultText;
    //alaways have to return something
  }
  //no () unlike methods as it is like a method that can never recieve any arguments

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart the quiz',
            ),
            color: Colors.blue)
      ],
    ));
  }
}
