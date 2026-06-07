import 'package:flutter/material.dart';
// import 'package:quiz_app2/model/question.dart';
import 'package:quiz_app2/model/questions.dart';
import 'package:quiz_app2/screen/result_screen.dart';
import 'package:quiz_app2/widget/answer_card.dart';
import 'package:quiz_app2/widget/rectangular_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;

  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];

    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    final isLastQuestion = questionIndex == questions.length - 1;

    final double progressValue = (questionIndex + 1) / questions.length;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Quiz App'),

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 60, 56, 56),
              const Color.fromARGB(255, 251, 50, 35),
              const Color.fromARGB(255, 159, 134, 134),
            ],
            stops: [0.0001, 0.8, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      question.question,
                      style: TextStyle(fontSize: 21),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(30),
                    shrinkWrap: true,
                    itemCount: question.options.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: AnswerCard(
                        currentIndex: index,
                        question: question.options[index],
                        isSelected: selectedAnswerIndex == index,
                        correctAnswerIndex: question.correctAnswerIndex,
                        selectedAnswerIndex: selectedAnswerIndex,
                      ),
                    ),
                  ),
                  isLastQuestion
                      ? RectangularButton(
                          label: 'Finish',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => ResultScreen(score: score),
                              ),
                            );
                          },
                        )
                      : RectangularButton(
                          label: 'Next',
                          onPressed: selectedAnswerIndex != null
                              ? goToNextQuestion
                              : null,
                        ),
                ],
              ),
            ),
            Positioned(
              bottom: 20, // Distance from the absolute bottom of the screen
              left: 24, // Matches your side padding
              right: 24, // Matches your side padding
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.black,
                      ),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Question ${questionIndex + 1} of ${questions.length}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
