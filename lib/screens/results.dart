import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswer.length; i++ ){
      summary.add({
        'question_index': i,
        'questions' : questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data ['correct_answer'] ;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numTotalQuestions out to $numCorrectQuestions questions correctly', 
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30,),
            Container(decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.blue],),
                borderRadius: BorderRadius.circular(20)
              ),
                child: ElevatedButton.icon(onPressed: onRestart, 
                label: const Text('Restart Quiz',
                style: TextStyle(color: Colors.white, fontSize: 20),),
                icon: Icon(Icons.replay_outlined, color:Colors.white,), 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, 
                shadowColor: Colors.transparent, 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
              )
          ],
        ),
      ),
    );
  }
}