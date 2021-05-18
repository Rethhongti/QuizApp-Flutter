import 'package:flutter/material.dart';
import 'answer.dart';

class Overquestion extends StatelessWidget {
  final Function restartQuestion;
  final int score;
  String endText;
  Overquestion(this.restartQuestion,this.score);

  String outputText(){
    score < 5 ? endText="Please Try more!" : (score ==10 ? endText ="You are excellent!" : endText="Great Job!");
    return endText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 250,bottom: 250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(outputText(),style: TextStyle(fontSize: 30,color: Colors.green),),
          Text("You Correct:$score",style: TextStyle(fontSize: 20),),
          Container(
              padding: EdgeInsets.only(left: 50,right: 50),
              child: Answer("Restart",restartQuestion),
          ),
        ],
      ),
    );
  }
}
