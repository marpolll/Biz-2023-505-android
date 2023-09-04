import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('My first App'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'Welcome to My Quiz App!',
//                 style: TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (ctx) => const Quiz(), // 퀴즈 화면으로 이동
//                     ),
//                   );
//                 },
//                 child: const Text('Start Quiz'), // 퀴즈 풀이 화면으로 이동하는 버튼
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0; // 점수 계산
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  final _questions = const [
    {
      'questionText': '프로그래밍 언어가 아닌것은?',
      'answers': [
        {'text': '자바', 'score': 10},
        {'text': 'c', 'score': 7},
        {'text': 'c++', 'score': 4},
        {'text': 's+', 'score': 1, 'correct': true},
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
    });
  }

  void _answerQuestion(int score) {
    final answers =
        _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>?;

    if (answers != null && answers.any((answer) => answer['correct'] == true)) {
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
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   var _questionIndex = 0;
//   var _totalScore = 0;
//   var _correctAnswers = 0;
//   var _incorrectAnswers = 0;
//   final _questions = const [
//     {
//       'questionText': '프로그래밍 언어가 아닌 것은?',
//       'answers': [
//         {'text': '자바', 'score': 10},
//         {'text': 'c', 'score': 7},
//         {'text': 'c++', 'score': 4},
//         {'text': 's+', 'score': 1, 'correct': true}, // 'correct' 오탈자 수정
//       ],
//     },
//     {
//       'questionText': '컴파일러 설명 중 틀린 것은?',
//       'answers': [
//         {'text': '머머머', 'score': 10},
//         {'text': '기계어로 변환', 'score': 7},
//         {'text': '자바', 'score': 4, 'correct': true},
//         {'text': '가가', 'score': 1},
//       ],
//     },
//   ];

//   void _resetQuiz() {
//     setState(() {
//       _questionIndex = 0;
//       _totalScore = 0;
//       _correctAnswers = 0; // 퀴즈 재시작시 정답 개수 초기화
//       _incorrectAnswers = 0; // 퀴즈 재시작시 오답 개수 초기화
//     });
//   }

//   void _answerQuestion(int score) {
//     final answers =
//         _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>;

//     if (answers.any((answer) => answer['correct'] == true)) {
//       _correctAnswers++;
//     } else {
//       _incorrectAnswers++;
//     }

//     _totalScore += score;

//     setState(() {
//       if (_questionIndex < _questions.length - 1) {
//         _questionIndex = _questionIndex + 1;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: const Center(
//             child: Text(
//               '퀴즈퀴즈',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         body: _questionIndex < _questions.length
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions)
//             : Result(
//                 _totalScore,
//                 _resetQuiz,
//                 _correctAnswers,
//                 _incorrectAnswers,
//               ),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
