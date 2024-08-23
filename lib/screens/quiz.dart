import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/screens/questions.dart';
import 'package:quiz_app/screens/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

List<String> selectedAnswers = [];
var activeScreen = 'home_screen'; 

  void switchScreen (){
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Home(switchScreen);

    if (activeScreen == 'questions_screen'){
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if(activeScreen == 'results_screen'){
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswers,
       onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/quiz.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          screenWidget
          ]
        )
      )
    );
  }
}