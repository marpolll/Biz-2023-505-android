import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });

  final String name;
  final String email;
  final User userDto;

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "여기는 자세히보기 Page 입니다.",
            ),
            Text("이름 : ${widget.name}"),
            Text("이메일 : ${widget.email}"),
            Text("이름 : ${widget.userDto.username}"),
            Text("비밀번호 : ${widget.userDto.password}"),
            Text("닉네임 : ${widget.userDto.nickname}"),
            Text("이메일 : ${widget.userDto.email}"),
            Text("전화번호 : ${widget.userDto.tel}"),
          ],
        ),
      ),
    );
  }
}
