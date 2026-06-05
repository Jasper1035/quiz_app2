import 'package:flutter/material.dart';
import 'package:quiz_app2/model/questions.dart';
import 'package:quiz_app2/widget/answer_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;

  int questionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: AnswerCard(
                  question: question.options[index],
                  isSelected: selectedAnswerIndex == index,
                  correctAnswerIndex: question.correctAnswerIndex,
                  currentIndex: index,
                  selectedAnswerIndex: selectedAnswerIndex,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
