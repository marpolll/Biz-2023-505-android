import 'package:flutter/material.dart';
import 'package:test/main.dart';

import '../quiz.dart';
import '../result.dart';

class QuizPageM extends StatefulWidget {
  const QuizPageM({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageM();
}

class _QuizPageM extends State<QuizPageM> {
  var _questionIndex = 0;
  var _totalScore = 0; // 점수 계산
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  final _questions = const [
    {
      'questionText': '중간중간중간',
      'answers': [
        {'text': '중간', 'score': 10},
        {'text': '중간', 'score': 7},
        {'text': '중간', 'score': 4},
        {'text': '중간', 'score': 1, 'correct': true},
      ],
    },
    {
      'questionText': '컴파일러 설명중 틀린것은?',
      'answers': [
        {'text': '머머머', 'score': 10},
        {'text': '기계어로 변환', 'score': 7},
        {'text': '자바', 'score': 4, 'correct': true},
        {'text': '가가', 'score': 1},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _correctAnswers = 0; // 퀴즈 재시작시 정답 개수 초기화
      _incorrectAnswers = 0; // 퀴즈 재시작시 오답 개수 초기화
    });
  }

  void _answerQuestion(int score) {
    final answers =
        _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>;

    if (answers.any((answer) => answer['correct'] == true)) {
      _correctAnswers++;
    } else {
      _incorrectAnswers++;
    }

    _totalScore += score;

    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex = _questionIndex + 1; // 다음 문제로 넘어감
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text(
              '퀴즈퀴즈',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(
                _totalScore, _resetQuiz, _correctAnswers, _incorrectAnswers),
        backgroundColor: Colors.black,
        persistentFooterButtons: [
          ElevatedButton.icon(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const HomePage(), // 홈으로이동
                ),
              )
            },
            icon: const Icon(Icons.home),
            label: const Text("메인으로"),
          )
        ],
      ),
    );
  }
}
