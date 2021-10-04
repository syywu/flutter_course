import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  //final means nothing will change once its initalisation in constructor- no changing after constructor. should be implemented in stateless widget
  //only when it runs it gets locked in with a questionText so then nothing chandges but values can chnage when code are getting compiled
//If you have data that it wil not change once it has its intial value then make it final
  Question(this.questionText);
  //poistional argument as there is only one

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
