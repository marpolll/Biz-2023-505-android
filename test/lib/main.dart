import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  final _questions = const [
    {
      'questionText': 'Whats your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'Whats your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 7},
        {'text': 'Lion', 'score': 4},
        {'text': 'Tiger', 'score': 1},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (score > 0) {
      _correctAnswers++; // 정답 선택시 정답 개수 증가
    } else {
      _incorrectAnswers++; // 오답 선택시 오답 개수 증가
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My first App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(
                  _totalScore, _resetQuiz, _correctAnswers, _incorrectAnswers)),
    );
  }
}
