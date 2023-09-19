import 'package:flutter/material.dart';
import 'package:test/anmation.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final int totalQuestions;
  final int progress;

  // const Quiz(
  //     {super.key,
  //     required this.answerQuestion,
  //     required this.questions,
  //     required this.questionIndex,
  //     required this.totalQuestions});

  const Quiz({
    Key? key,
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
    required this.totalQuestions,
    required this.progress, // 수정된 부분
  }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(children: [
//         const AnimatedBackground(),
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Question(
//                 questions[questionIndex]["questionText"] as String,
//               ),
//               ...(questions[questionIndex]["answers"]
//                       as List<Map<String, Object>>)
//                   .map((answer) {
//                 return Answer(() => answerQuestion(answer['correct'] as bool),
//                     answer['text'] as String);
//               }).toList()
//             ],
//           ),
//         ),
//       ]),
//       // persistentFooterButtons: [
//       //   ElevatedButton.icon(
//       //     onPressed: () => {
//       //       Navigator.of(context).push(
//       //         MaterialPageRoute(
//       //           builder: (ctx) => const HomePage(), // 홈으로이동
//       //         ),
//       //       )
//       //     },
//       //     icon: const Icon(Icons.home),
//       //     label: const Text("메인으로"),
//       //   )
//       // ],
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const AnimatedBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 진행률 표시
                // Text(
                //   'Question ${questionIndex + 1} / 20', // 진행률 표시
                //   style: const TextStyle(color: Colors.white),
                // ),
                Question(
                  questions[questionIndex]["questionText"] as String,
                ),
                ...(questions[questionIndex]["answers"]
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(() => answerQuestion(answer['correct'] as bool),
                      answer['text'] as String);
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:test/anmation.dart';
// import './question.dart';
// import './answer.dart';

// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;
//   final int totalQuestions;
//   final int progress;

//   const Quiz({
//     Key? key,
//     required this.answerQuestion,
//     required this.questions,
//     required this.questionIndex,
//     required this.totalQuestions,
//     required this.progress,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           const AnimatedBackground(),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '난이도: ${questions[questionIndex]["difficulty"]}',
//                   style: const TextStyle(fontSize: 24, color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   '문제 수: $totalQuestions',
//                   style: const TextStyle(fontSize: 24, color: Colors.white),
//                 ),
//                 Question(
//                   questions[questionIndex]["questionText"] as String,
//                 ),
//                 ...(questions[questionIndex]["answers"]
//                         as List<Map<String, Object>>)
//                     .map((answer) {
//                   return Answer(() => answerQuestion(answer['correct'] as bool),
//                       answer['text'] as String);
//                 }).toList(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
