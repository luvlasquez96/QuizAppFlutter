
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.homeQuiz, {super.key});

  final void Function() homeQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20,),
              Text('Learn Flutter the fun way!', style: GoogleFonts.lato(
                color: Colors.white, 
                fontSize: 24),),
              SizedBox(height: 20,),
              Container(decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.blue],),
                borderRadius: BorderRadius.circular(20)
              ),
                child: ElevatedButton.icon(onPressed: homeQuiz, 
                label: const Text('Start Quiz',
                style: TextStyle(color: Colors.white, fontSize: 20),),
                icon: Icon(Icons.arrow_right, color:Colors.white,), 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, 
                shadowColor: Colors.transparent, 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
              )
            ]),
          );
  }
}
