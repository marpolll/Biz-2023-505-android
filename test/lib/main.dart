// import 'package:flutter/material.dart';
// import './quiz.dart';
// import './result.dart';

// void main() {
//   runApp(const MyApp());
// }

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

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   var _questionIndex = 0;
//   var _totalScore = 0; // 점수 계산
//   var _correctAnswers = 0; // 정답 개수를 저장하는 변수
//   var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
//   final _questions = const [
//     {
//       'questionText': '프로그래밍 언어가 아닌것은?',
//       'answers': [
//         {'text': '자바', 'score': 10},
//         {'text': 'c', 'score': 7},
//         {'text': 'c++', 'score': 4},
//         {'text': 's+', 'score': 1, 'correct': true},
//       ],
//     },
//     {
//       'questionText': '컴파일러 설명중 틀린것은?',
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
//     });
//   }

//   void _answerQuestion(int score) {
//     final answers =
//         _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>?;

//     if (answers != null && answers.any((answer) => answer['correct'] == true)) {
//       _correctAnswers++;
//     } else {
//       _incorrectAnswers++;
//     }

//     _totalScore += score;

//     setState(() {
//       if (_questionIndex < _questions.length - 1) {
//         _questionIndex = _questionIndex + 1; // 다음 문제로 넘어감
//       } else {
//         _questionIndex = _questionIndex + 1;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(primarySwatch: Colors.blue),
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
//                 _totalScore, _resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:test/anmation.dart';
import 'package:test/level/h.dart';
import 'package:test/level/l.dart';
import 'package:test/level/m.dart';

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
//           title: const Text('퀴즈퀴즈'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 '시작하려면 버튼을 클릭하세요',
//                 style: TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (ctx) => const QuizPage(), // 퀴즈 페이지로 이동
//                     ),
//                   );
//                 },
//                 child: const Text('Start Quiz'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // HomePage로 진입
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.create_new_folder_rounded))
          ],
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              '퀴즈퀴즈',
              style: TextStyle(color: Colors.white),
            ),
          )),
      // drawer: Drawer(
      //   child: ListView(
      //     children: const [
      //       // UserAccountsDrawerHeader(
      //       //   accountName: const Text("hong"),
      //       //   accountEmail: const Text("hong@naver.com"),
      //       //   currentAccountPicture: CircleAvatar(
      //       //     backgroundColor: Colors.red,
      //       //     child: Column(
      //       //       children: [
      //       //         ClipRRect(
      //       //           borderRadius: BorderRadius.circular(50),
      //       //           child: Image.asset(
      //       //             "images/sun.jpg",
      //       //           ),
      //       //         ),
      //       //         const Text("hong"),
      //       //       ],
      //       //     ),
      //       //   ),
      //       // ),
      //       ListTile(
      //         title: Text("마이페이지"),
      //         leading: Icon(Icons.person),
      //       ),
      //       Divider(
      //         height: 0.1,
      //       ),
      //       ListTile(
      //         title: Text("학습하기"),
      //         leading: Icon(Icons.book),
      //       ),
      //       ListTile(
      //         title: Text("기록"),
      //         leading: Icon(Icons.timelapse),
      //       ),
      //     ],
      //   ),
      // ),
      // persistentFooterButtons: [
      //   ElevatedButton.icon(
      //     onPressed: () => {},
      //     icon: const Icon(Icons.add),
      //     label: const Text("문제추가"),
      //     style: const ButtonStyle(
      //       backgroundColor: MaterialStatePropertyAll(Colors.red),
      //       textStyle: MaterialStatePropertyAll(
      //         TextStyle(
      //           fontSize: 15,
      //           color: Colors.yellow,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
      body:
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/back.jpg'), // 이미지 경로에 맞게 수정
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          Stack(children: [
        const AnimatedBackground(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '퀴즈 난이도를 선택해 주세요',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 홈 페이지에서 퀴즈 페이지로 이동
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const QuizPageH(), // 퀴즈 페이지로 이동
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white54, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // 버튼의 모양을 변경
                  ),
                ),
                child: const Text(
                  '상',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 홈 페이지에서 퀴즈 페이지로 이동
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const QuizPageM(), // 퀴즈 페이지로 이동
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white54, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // 버튼의 모양을 변경
                  ),
                ),
                child: const Text(
                  '중',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 홈 페이지에서 퀴즈 페이지로 이동
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const QuizPageL(), // 퀴즈 페이지로 이동
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white54, // 텍스트 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // 버튼의 모양을 변경
                  ),
                ),
                child: const Text(
                  '하',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

// class QuizPage extends StatefulWidget {
//   const QuizPage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MyAppState();
// }

// class _MyAppState extends State<QuizPage> {
//   var _questionIndex = 0;
//   var _totalScore = 0; // 점수 계산
//   var _correctAnswers = 0; // 정답 개수를 저장하는 변수
//   var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
//   final _questions = const [
//     {
//       'questionText': '프로그래밍 언어가 아닌것은?',
//       'answers': [
//         {'text': '자바', 'score': 10},
//         {'text': 'c', 'score': 7},
//         {'text': 'c++', 'score': 4},
//         {'text': 's+', 'score': 1, 'correct': true},
//       ],
//     },
//     {
//       'questionText': '컴파일러 설명중 틀린것은?',
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
//         _questionIndex = _questionIndex + 1; // 다음 문제로 넘어감
//       } else {
//         _questionIndex = _questionIndex + 1;
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
//                 _totalScore, _resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
