import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function pressHandler;
  Answer(this.answerText,this.pressHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:8,bottom: 8),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.only(top:15,bottom: 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.orange,
        child: Text(answerText , style: TextStyle(fontSize: 20),),
        textColor: Colors.white,
        onPressed: pressHandler,
      ),
    );
  }
}
