import 'package:flutter/material.dart';
import 'package:quiz_app2/model/questions.dart';
import 'package:quiz_app2/screen/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('result')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 1000),
          Text(
            'Your Score',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.green,
                  strokeWidth: 10,
                  value: score / 9,
                ),
              ),
              Column(
                children: [
                  Text(score.toString(), style: TextStyle(fontSize: 80)),
                  SizedBox(height: 10),
                  Text('${(score / questions.length * 100).round()} %'),
                ],
              ),
            ],
          ),
          SizedBox(height: 80),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => QuizScreen()),
                      );
                    },
                    label: Text(
                      'Restart',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    icon: Icon(Icons.refresh),
                    style: TextButton.styleFrom(
                      iconSize: 40,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blueGrey,

                      elevation: 13,

                      shadowColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
