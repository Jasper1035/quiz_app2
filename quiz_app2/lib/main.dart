import 'package:flutter/material.dart';
import 'package:quiz_app2/screen/quiz_screen.dart';
// import 'package:quiz_app2/screen/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}
