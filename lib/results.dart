import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultScore;
  //_totalScore will be stored in this property

  Results(this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('You did it!'));
  }
}
