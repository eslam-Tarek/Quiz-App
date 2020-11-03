import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Provider/questionData.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuestionData>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height:30),
            Text(
              'quiz'.toUpperCase(),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color:Colors.white,
              ),
            ),
           SizedBox(height:20),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text(
               data.getquestion(),
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 30,
                 color: Colors.black87,
               ),
              ),
           ),
            Expanded(
              child: ListView.builder(
                itemCount: data.getanswerCount(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: (){
                          data.getNextQuestion(context,index);
                        },
                        child:Text(
                          data.getanswer(index),
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ) ,
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}