import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/screens/questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
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
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20,),
              const Text('Learn Flutter the fun way!', style: TextStyle(color: Colors.white, fontSize: 24),),
              SizedBox(height: 20,),
              Container(decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.blue],),
                borderRadius: BorderRadius.circular(20)
              ),
                child: ElevatedButton.icon(onPressed: (){
                  QuestionsScreen();
                }, 
                label: const Text('Start Quiz',
                style: TextStyle(color: Colors.white, fontSize: 20),),
                icon: Icon(Icons.arrow_right, color:Colors.white,), 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, 
                shadowColor: Colors.transparent, 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
