import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  //Use final if a value doesn't change from the point of time when the program runs
  //_answerQuestion is stored here in selectHandler as a pointer and function
  String answerText;

  Answer(this.selectHandler, this.answerText);
  //answerText in constructor as Answer() takes answer as a string in main.dart

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: selectHandler,
      ),
    );
  }
}
