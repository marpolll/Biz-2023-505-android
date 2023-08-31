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
      'questionText': '프로그래밍 언어가 아닌것은?',
      'answers': [
        {'text': '자바', 'score': 10},
        {'text': 'c', 'score': 7},
        {'text': 'c++', 'score': 4},
        {'text': 'flutter', 'score': 1},
      ],
    },
    {
      'questionText': '컴파일러 설명중 틀린것은?',
      'answers': [
        {'text': '머머머', 'score': 10},
        {'text': '기계어로 변환', 'score': 7},
        {'text': '자바', 'score': 4},
        {'text': '가가', 'score': 1},
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
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(
              child: Text(
                '퀴즈퀴즈',
                style: TextStyle(color: Colors.black),
              ),
            ),
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
