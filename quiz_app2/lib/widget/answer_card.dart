import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int correctAnswerIndex;
  final int currentIndex;
  final int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: selectedAnswerIndex != null
          ? Container(
              height: 70,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isCorrectAnswer
                      ? Colors.green
                      : isWrongAnswer
                      ? Colors.red
                      : Colors.white24,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(question, style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(width: 10),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                      ? buildWrongIcon()
                      : SizedBox.shrink(),
                ],
              ),
            )
          : Container(
              height: 70,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(question, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
    );
  }
}

Widget buildCorrectIcon() {
  return CircleAvatar(
    radius: 10,
    backgroundColor: Colors.green,
    child: Icon(Icons.check, color: Colors.white),
  );
}

Widget buildWrongIcon() {
  return CircleAvatar(
    radius: 10,
    backgroundColor: Colors.red,
    child: Icon(Icons.close, color: Colors.white),
  );
}
