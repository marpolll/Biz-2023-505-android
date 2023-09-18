import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageL extends StatefulWidget {
  const QuizPageL({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageL();
}

class _QuizPageL extends State<QuizPageL> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(20, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': '중간중간중간',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '컴파일러 설명중 틀린것은?',
      'answers': [
        {'text': '머머머', 'correct': false},
        {'text': '기계어로 변환', 'correct': false},
        {'text': '자바', 'correct': true},
        {'text': '가가', 'correct': false},
      ],
    },
    {
      'questionText': '1',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '2',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '3',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '4',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '5',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '6',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '7',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '8',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '9',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '10',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '11',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '12',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '13',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '14',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '15',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '16',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '17',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '18',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '19',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '20',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '21',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '22',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
    {
      'questionText': '23',
      'answers': [
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': false},
        {'text': '중간', 'correct': true},
        {'text': '중간', 'correct': false},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      // _totalScore = 0;
      _correctAnswers = 0; // 퀴즈 재시작시 정답 개수 초기화
      _incorrectAnswers = 0; // 퀴즈 재시작시 오답 개수 초기화
      _usedQuestionIndices.clear();
      _currentProgress = 1;
    });
  }

  void _updateProgress() {
    setState(() {
      _currentProgress++;
    });
  }

  void _answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _correctAnswers++;
      } else {
        _incorrectAnswers++;
      }

      // 사용하지 않은 문제들 중에서 랜덤으로 문제 선택
      int newIndex;
      do {
        newIndex = Random().nextInt(_questions.length);
      } while (!_usedQuestionIndices.contains(newIndex));

      // 선택된 문제를 사용한 문제들 집합에서 제거
      _usedQuestionIndices.remove(newIndex);

      // Update progress
      _updateProgress();

      if (_usedQuestionIndices.isNotEmpty) {
        // 아직 사용하지 않은 문제가 있다면 퀴즈 계속 진행
        _questionIndex = newIndex; // 수정된 부분
      } else {
        // 퀴즈 종료 후 결과 페이지로 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              '퀴즈퀴즈',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
        body: _usedQuestionIndices.isNotEmpty
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                totalQuestions: _questions.length,
                progress: _currentProgress,
              )
            : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
        backgroundColor: Colors.black,
      ),
    );
  }
}

//   void _answerQuestion(bool isCorrect) {
//     setState(() {
//       if (isCorrect) {
//         _correctAnswers++;
//       } else {
//         _incorrectAnswers++;
//       }

//       // 사용하지 않은 문제들 중에서 랜덤으로 문제 선택
//       int newIndex;
//       do {
//         newIndex = Random().nextInt(_questions.length);
//       } while (!_usedQuestionIndices.contains(newIndex));

//       // 선택된 문제를 사용한 문제들 집합에서 제거
//       _usedQuestionIndices.remove(newIndex);

//       // 선택된 문제로 변경
//       _questionIndex = newIndex;

//       if (_usedQuestionIndices.isNotEmpty) {
//         // 아직 사용하지 않은 문제가 있다면 퀴즈 계속 진행
//         // 여기에 다음 문제로 넘어가는 로직을 추가할 수 있습니다.
//       } else {
//         // 퀴즈 종료 후 결과 페이지로 이동
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (ctx) =>
//                 Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: const Center(
//             child: Text(
//               '퀴즈퀴즈',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (ctx) => const HomePage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.home),
//             ),
//           ],
//         ),
//         body: _questionIndex < _questions.length
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions)
//             : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
