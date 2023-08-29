/// flutter 프로젝트를 열었는데 import 에서 오류가 발생한 경우
///  프로젝트 폴더에서 flutter pub get 실행하기
import 'package:flutter/material.dart';

/// dart 프로젝트 시작점
void main(List<String> args) {
  // 아래 코드 줄인거
  // MyApp app = const MyApp();
  // runApp(app);
  runApp(const MyApp());
}

// flutter 로 생성한 app 의 시작점
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "반가워",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const StartPage());
  }
}

/// state 를 사용하여 화면에 지속적인 변화를 주기위한 시작점
/// StatefulWidget 의 State 위젯을 생성, 컨트롤
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override

  /// _StartPage 클래스의 생성자를 호출하여 객체를 생성하는 코드
  State<StartPage> createState() => _StartPage();
}

/// StartPage(StatefulWidget) 가 생성하고 컨트롤 할 State
/// 클래스 이름에 UnderScore(_)를 붙이면 이클래스는 private 성질을 갖는다.
/// 현재 보전의 dart 에서는 UnderScore(_) 를 사용하지 말라고 권장하는데,
/// flutter 의 State 클래스에는 통상 UnderScore(_) 붙여서 StatefulWedget 의
/// 이름과 같이 만든다.
class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("first app")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("반가워요"),
            Text("하이"),
            Text("하이"),
            Text("하이"),
            Text("하이"),
            Text("하이"),
            Text("하이"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.email),
      ),
    );
  }
}
