import 'package:flutter/material.dart';

class QuiestionIdentifier extends StatelessWidget {
  const QuiestionIdentifier({super.key, required this.isCorrectAnswer, required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
        ? const Color.fromARGB(255, 92, 171, 95) 
        : const Color.fromARGB(255, 226, 100, 91),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(questionNumber.toString(),
       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
    );
  }
}