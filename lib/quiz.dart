import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  //this is for us to know which questions we are looking at
  final VoidCallback answerQuestion;
  //not private as this widget should be used in other files

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  //required means these values are always required

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        //questions.atElement(0) is the same as [0]
        //questionIndex would change accordingly
        ...(questions[questionIndex]['answerText'] as List<Map<String, Object>>)
            //now this is a list of string and obj as it contains string and int
            //adding as String ti specify which data to expect
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
          //forward annon fucntion () =>. function is created on the fly and stored as memory and instead of storing in variable which hold the address, the address gets back automatically.
          //so we get address here and forward that to answer
          //this fucntion is triggered when the button is pressed
        }).toList()
        //.map() maps the list into something else i.e. transform the list into something else- instead of a list of maps, its a list of widgets which can be merged and added to Column()- return a new value as map returns a new list where we don't have to keep the old structure- so a list of widgets where we can merge into Column().
        //question is a list, a list is a class- an object in Dart and that class defines a map method
        //the map method executes a function which you have to pass an arg to map on every element in the list in which you call map(question list). could use named function which can be created or use an anon function since we only need it here and no other place in the file.
        //Pass a current element that we are looking at into function as it will be executed  for every element in the question list. The current element for the current function execution is received as an arg inside of this function which is applied to every element.
        //For every element in questions, we want to return a new element which replaces it and that should be a widget(Answer()).
        //We want to go through all the answers for the question we are looking at- questions[_questionIndex]['answers'] to give us a list of answers. Forward answer in map() to Answer().
        //Dart cannot detect 'answers' to be list so use as List<String>- as keyword tells Dart that this will have a specific type
        //Pass a pointer to our _answeQuestion function and forward this for every answer in which we are creating. The end result is now we have a list of widgets
        //Map does not give us a list but a iterable which is a parent class for all different iterables- so a map is a iterable and to tell Dart that we want a list and not a map by using .toList()- this converts the value map gives us to a list. Map does not change the value or variable in questions but to create a new list instead based on the existing one and transform it in the body of the function will be passed to map.
        //... spread operator takes a list and pull out all the values out of the list and add them to surrounding list as individual values we don't add a list to a list but instead values of a list to a list, having one list without nested list.
        //Answer(_answeQuestion)- The function (address) we are passing around is known as callback because the recieving widget calls it in the future. No () as we do not want to execute the function immediately
        //this triggers a function that's actually defined in a different widget from inside our answer widget as we pass a ref to the function down to answer widget here in our MyAppState. this means the communication between parent and child works
      ],
    );
  }
}
