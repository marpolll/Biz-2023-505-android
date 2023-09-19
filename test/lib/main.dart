import 'package:flutter/material.dart';
import 'package:test/anmation.dart';
import 'package:test/level/h.dart';
import 'package:test/level/l.dart';
import 'package:test/level/m.dart';

void main() {
  runApp(const MyApp());
}

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
      body: Stack(children: [
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

// import 'package:flutter/material.dart';
// import 'package:test/anmation.dart';
// import 'package:test/select.dart';
// import './question.dart';
// import './answer.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.create_new_folder_rounded),
//           )
//         ],
//         backgroundColor: Colors.black,
//         title: const Center(
//           child: Text(
//             '퀴즈퀴즈',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           const AnimatedBackground(),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   '퀴즈 난이도를 선택해 주세요',
//                   style: TextStyle(fontSize: 24, color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (ctx) => const SelectQuestionCountPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white54,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   child: const Text(
//                     '상',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (ctx) => const SelectQuestionCountPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white54,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   child: const Text(
//                     '중',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (ctx) => const SelectQuestionCountPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white54,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   child: const Text(
//                     '하',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
