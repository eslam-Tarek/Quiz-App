import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Provider/questionData.dart';
import 'package:quizapp/Screen/quiz.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuestionData>(context);
    return Scaffold(
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
            color: Colors.white,
            child: Center(
              child: 
              Text(
                'Your Score is ${data.score.toString()} from 50 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 42,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Quiz();
                }));
              },
              child: Text(
                'Rest Quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
         ],
       ),
    );
  }
}