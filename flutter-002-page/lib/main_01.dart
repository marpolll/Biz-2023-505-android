import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "나의 app",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// 컨테이너 위젯
  /// Container : padding, margin 을 부여하는 box
  /// Expanded : 부모 box 를 가득 채우는 구조의 box
  /// Padding : padding 을 기본값으로 갖는 box

  // Widget 변수 선언하기
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕하세요",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "우리나라 자랑",
                style: TextStyle(
                  color: Color(0xffAAAAAA), //Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const Text("50"),
      ],
    ),
  );

  // Widget 함수 선언하기
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),
      child: const Text(
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 "
        "우리는 어찌고 저쩌고 ",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "반갑습니다.",
          style: TextStyle(
            /// size 는 단위가 없다.
            /// 이 크기는 pixel Ratio 값을 곱하여 pixel 로 표현한다.
            fontSize: 30,

            /// 컬러를 지정하면, MaterialApp 에 Theme 를 설정했을 경우
            /// 실제 컬러와 다르게 보일수 있다.
            color: Colors.black,
          ),
        ),
        Text(
          "가나다라마바사",
          style: TextStyle(
            fontSize: 40,
            color: Colors.yellow,
          ),
        ),
        Text(
          "반갑",
          style: TextStyle(
            fontSize: 50,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
