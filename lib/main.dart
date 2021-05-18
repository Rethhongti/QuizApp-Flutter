import 'package:flutter/material.dart';
import 'package:flutterqpp/answer.dart';
import 'package:flutterqpp/overquestion.dart';
import 'package:flutterqpp/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var _totalScore = 0;
  final _questions = const[
    {
      "question": "How many country in Cambodia?",
      "answer" : [
        {"ans":"23","score":0},
        {"ans":"24","score":0},
        {"ans":"25","score":1},
        {"ans":"52","score":0},
      ]
    },
    {
      "question": "កម្ពុជាមានផ្ទៃដីចំនួនប៉ុន្មាន?(គិតជាគីឡូម៉ែត្រការ៉េ)",
      "answer" : [
        {"ans":"1,000,000","score":0},
        {"ans":"181,000","score":0},
        {"ans":"181,035","score":1},
        {"ans":"180,035","score":0},
      ]
    },
    {
      "question": "Which country below has a temple?",
      "answer" : [
        {"ans":"Kompot","score":0},
        {"ans":"Siem Reap","score":1},
        {"ans":"Koh Kong","score":0},
        {"ans":"Prey Veng","score":0},
      ]
    },
    {
      "question": "When Cambodia got dependence from French?",
      "answer" : [
        {"ans":"11 November 1953","score":0},
        {"ans":"11 September 1953","score":0},
        {"ans":"9 November 1953","score":1},
        {"ans":"7 January 1979","score":0},
      ]
    },
    {
      "question": "តើបាវចនាជាតិកម្ពុជាមានអ្វីខ្លះ?",
      "answer" : [
        {"ans":"ព្រះរាជវាំង,រដ្ធសភា,ព្រឺទ្ធសភា","score":0},
        {"ans":"ជាតិ,សាសនា,ព្រះមហាក្សត្រ","score":1},
        {"ans":"ព្រះមហាក្សត្រ,នាយករដ្ធមន្រ្ដី","score":0},
      ]
    },
    {
      "question": "How cambodia people greeting?",
      "answer" : [
        {"ans":"Shake Hand","score":0},
        {"ans":"Kisses","score":0},
        {"ans":"Wai","score":1},
        {"ans":"Hug","score":0},
      ]
    },
    {
      "question": "Which are three colors of Cambodia flag?",
      "answer" : [
        {"ans":"Green Yellow White","score":0},
        {"ans":"Red White Yellow","score":0},
        {"ans":"Purple Pink Orange","score":0},
        {"ans":"Blue White Red","score":1},
      ]
    },
    {
      "question": "What is currency in Cambodia?",
      "answer" : [
        {"ans":"Dollar","score":0},
        {"ans":"Baht","score":0},
        {"ans":"Riel","score":1},
        {"ans":"Yuan","score":0},
      ]
    },
    {
      "question": "What is big sign in Cambodia flag?",
      "answer" : [
        {"ans":"Tiger","score":0},
        {"ans":"Temple","score":1},
        {"ans":"Sun","score":0},
        {"ans":"Lion","score":0},
      ]
    },
    {
      "question": "What is the capital city of Cambodia?",
      "answer" : [
        {"ans":"Takmoa","score":0},
        {"ans":"Poipet","score":0},
        {"ans":"Phnom Penh","score":1},
        {"ans":"Serey Sophorn","score":0},
      ]
    },
  ];
  void _moveQuestion(int score){
    _totalScore += score;
    setState(() {
      _index = _index + 1;
    });
  }
  void _restartQuestion(){
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text("Cambodia Quiz"),
          leading: Icon(Icons.lightbulb_outline),
        ),
        body: _index >= _questions.length ? Overquestion(_restartQuestion,_totalScore) : _buildBody,
      ),
    );
  }
  get _buildBody{
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Question${_index+1}",style: TextStyle(fontSize: 18),),
            Question(_questions[_index]["question"]),
            Container(
              margin: EdgeInsets.only(top:70),
              child: Column(
                children: <Widget>[
                  ...(_questions[_index]["answer"] as List<Map<String,Object>>).map((answer){
                    return Answer(answer["ans"],() => _moveQuestion(answer["score"]));
                  }).toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
