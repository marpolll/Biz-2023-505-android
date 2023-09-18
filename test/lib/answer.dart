import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage("images/back.jpg"),
      //   ),
      // ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
