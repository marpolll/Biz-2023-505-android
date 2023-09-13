import 'package:flutter/material.dart';
import 'package:quiz/quiz_app/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizHomePage(),
    );
  }
}
