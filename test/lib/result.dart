import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  final int correctAnswers;
  final int incorrectAnswers;

  const Result(this.resultScore, this.resetHandler, this.correctAnswers,
      this.incorrectAnswers,
      {Key? key})
      : super(key: key);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 2) {
      resultText = "You are awesome and Innocent!";
    } else if (resultScore <= 8) {
      resultText = "just good!";
    } else if (resultScore <= 14) {
      resultText = "normal";
    } else {
      resultText = "oh my god!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: const TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          '정답: $correctAnswers', // 정답 개수 표시
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          '오답: $incorrectAnswers', // 오답 개수 표시
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: resetHandler,
            child: const Text('문제확인')),
        TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: resetHandler,
            child: const Text('퀴즈다시풀기')),
        // TextButton(
        //     style: ButtonStyle(
        //         foregroundColor: MaterialStateProperty.all(Colors.blue)),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (ctx) => const HomePage(), // 홈으로이동
        //         ),
        //       );
        //     },
        //     child: const Text('메인으로')),
      ]),
    );
  }
}
