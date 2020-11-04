import 'package:flutter/material.dart';
import 'package:quizapp/Screen/quiz.dart';
import 'package:quizapp/Screen/result.dart';
import 'package:quizapp/models/question.dart';

class QuestionData extends ChangeNotifier{
  int _questionNumber = 0;
  int score =0;
  List<Question> _question = [
    Question(
      'What is the Capital of America ?',
      [
        {
          'txt' : 'Cairo',
          'score' : 0, 
        },
        {
          'txt' : 'New York',
          'score' : 10, 
        },
        {
          'txt' : 'Dobi',
          'score' : 0, 
        },
        {
          'txt' : 'paris',
          'score' : 0, 
        },
     ]
    ),
    Question(
      'What is the Capital of Egypte ?',
      [
        {
          'txt' : 'Cairo',
          'score' : 10, 
        },
        {
          'txt' : 'New York',
          'score' : 0, 
        },
        {
          'txt' : 'Dobi',
          'score' : 0, 
        },
        {
          'txt' : 'paris',
          'score' : 0, 
        },
     ]
    ),  
    Question(
      'What is the Number of English Letters?',
      [
        {
          'txt' : '15',
          'score' : 0, 
        },
        {
          'txt' : '20',
          'score' : 0, 
        },
        {
          'txt' : '26',
          'score' : 10, 
        },
        {
          'txt' : '30',
          'score' : 0, 
        },
     ]
    ),
    Question(
      'What is the number of colors of the Egyptian flag ?',
      [
        {
          'txt' : '3',
          'score' : 10, 
        },
        {
          'txt' : '2',
          'score' : 0, 
        },
        {
          'txt' : '4',
          'score' : 0, 
        },
        {
          'txt' : '1',
          'score' : 0, 
        },
     ]
    ),
    Question(
      'Where is the Holy Kaaba ?',
      [
        {
          'txt' : 'ُEgypte',
          'score' : 0, 
        },
        {
          'txt' : 'France',
          'score' : 0, 
        },
        {
          'txt' : 'Saudi',
          'score' : 10, 
        },
        {
          'txt' : 'UAE',
          'score' : 0, 
        },
     ]
    ),
  ];
 // get Question txt
  String getquestion(){
    return _question[_questionNumber].title;
  }
  // get count of Answer List
  getanswerCount(){
    return _question[_questionNumber].answer.length;
  }
  // get answer text 
  String getanswer(int index){
    return _question[_questionNumber].answer[index]['txt'];
  }
  // calclute total score
  getScore(int index){
    score += _question[_questionNumber].answer[index]['score'];
    print(score);
  }
  // get the question or fish quiz
  getNextQuestion(BuildContext context ,int index){
    getScore(index);
    if(_questionNumber < _question.length-1){
      _questionNumber++;
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Result();
      }));
    }
    notifyListeners();
  }
  // rest the quiz 

   restQuiz(BuildContext context){
     _questionNumber = 0;
     score = 0;
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Quiz();
    }));
    notifyListeners();
  }
}