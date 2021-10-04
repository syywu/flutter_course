//unlocks a lot of core features for flutter
import 'package:flutter/material.dart';
import 'package:flutter_course/answer.dart';
import 'package:flutter_course/question.dart';
import 'package:flutter_course/results.dart';
import 'quiz.dart';

// void main() {
//   runApp(MyApp());
//   //runs the app and build is ran for the first time here (calls build function)
// }

void main() => runApp(MyApp());
// => shorthand for return and only works for one line code

class MyApp extends StatefulWidget {
  //this class can be rebuilt/recreated when the external data changes
  //MyApp is the parent widget of Question() and Answer()- needs to manage state here (lifting state up)- manage state in the common demonanator of the different widgets that need the state which is the direct parent that need the state

  //add method to connect state to this widget
  @override
  //createState is a method provided by statfulwidget and it needs to be overrideen
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //this class must stay persistent- important for storing your state . state is attached to the widget- the UI element that we see. data will not be resetted here
  //state is imported from material.dart and is a generic class
  //<MyApp> connects state to widget

//Scoping- treated as a variable/ const only available in the build method, not in the entire class so move under MyAppState
  final _questions = const [
    //compiled time constant, not run time constant like final is
    //If you know at the time of writing the code what the final value will be and this value will never change (not be changed during runtime).
    //The final value is not logged in when your code executes but already after you wrote the code- this question list will never change
    //const can be assigned to the value too e.g var questions = const []; this means a new value can be assigned and will be overriden i.e. var questions = []
    //var questions = [] will not work if const questions
    //If you do not want to change the object ever then make the value a const. If you have a list and the variables should never change then make the whole variable a const so both variable and list are protected from change.
    {
      'questionText': 'What\'s your favourite color?',
      'answerText': [
        {'text': 'red', 'score': 5},
        {'text': 'blue', 'score': 2},
        {'text': 'pink', 'score': 9},
        {'text': 'green', 'score': 7}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answerText': [
        {'text': 'dog', 'score': 8},
        {'text': 'cat', 'score': 3},
        {'text': 'horse', 'score': 7},
        {'text': 'panda', 'score': 6}
      ]
    },
    {
      'questionText': 'What\'s your favourite city?',
      'answerText': [
        {'text': 'Paris', 'score': 6},
        {'text': 'London', 'score': 8},
        {'text': 'New York', 'score': 4},
        {'text': 'Tokyo', 'score': 10}
      ]
    }
    //turning questions into maps
  ];
  //_ this makes the class private and only accessible within main.dart so it cannot be manipulated from outside
  var _questionIndex = 0;
  //var used instead of int as we have already stated a number 0
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    //_totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //setState is a method that typically takes in annoymous function. setState allows changes to appears in the UI
    //setState is placed when chnages happen
    //setstate updates widget by calling build method again and recuilds widget tree
    print(_questionIndex);
    //this stores questionIndex 0 + 1 into new questionIndex so next question will be selected everytime the button is pressed
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('No more questions!');
    }
    //this goes here so that _questionIndex can be checked to see if it is less that questions.length after the check above
  }
  //this is all internal data above (internal state)

  @override
  //this is a decorator which makes code cleaner. overrides the build method deliberatly provided by the stateless widget
  //we overrides build with our own version. the build in stateless widget is not considered but the one we made as it is overridden
  Widget build(BuildContext context) {
    //context is a special type of obj passed into build()
    //BuildContext is a class from material.dart which is required in build()- special obj type
    //Widget to retun widgets
    //build method is always responsible for returning a new widget

    return MaterialApp(
      //MaterialApp- base set up provided by flutter. does heavy lifting in the bg
      home: Scaffold(
          appBar: AppBar(
            title: Text('This App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              //since questions is a property of an entire class, it should be private only available in myAppState to be in line with _questionIndex
              : Results(_totalScore)
          //center widget takes everything into centre
          //bdy only takes one widget
          //all widgets are classes
          ),
      //home is core widget
    );
  }
}
