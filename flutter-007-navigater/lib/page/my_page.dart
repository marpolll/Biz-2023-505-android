import 'package:flutter/material.dart';
// import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/user_input.dart';

import '../models/user.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "여기는 User Page 입니다.",
              ),
              ElevatedButton(
                  onPressed: () async {
                    var userDto = User(
                        username: "이몽룡",
                        password: "9999999",
                        nickname: "암행어사",
                        tel: "010-2222-2222",
                        email: "solas@solas.com");
                    var result =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserInput(userDto: userDto),
                    ));

                    var resultStr = """
                      username = ${result.username}
                      password = ${result.password}
                      nickname = ${result.nickname}
                    """;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(resultStr),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  },
                  child: const Text("정보수정"))
            ],
          ),
        ),
      ),
    );
  }
}
