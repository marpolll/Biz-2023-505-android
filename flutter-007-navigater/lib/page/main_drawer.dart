import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';

Widget mainDrawer(context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("marpol"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
              )
            ],
            accountName: Text("marpol"),
            accountEmail: Text("marpol@marpol.com"),
          ),
          ListTile(
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onTap: () {
                debugPrint("Home 메뉴가 클릭됨");

                /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
                /// web, pc, 어플리케이션 에서는 단순히 화면을 전환하는데
                /// 별 어려움 없이 수행이 가능하다.
                /// 하지만 스마트 기기에서는 화면 하나가 context 이다.
                /// 화면을 전환 시킬때도 context 라는
                /// 친구를 잘 관리 해야 한다.
                // const HomePage();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              }),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text(
              "User",
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
            leading: const Icon(
              Icons.personal_injury_outlined,
              color: Colors.blue,
            ),
            onTap: () => Navigator.of(context).pushNamed("/mypage"),
          ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
              title: const Text(
                "Email",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              leading: const Icon(
                Icons.email,
                color: Colors.blue,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed("/emailpage", arguments: {
                    "email": "marpol@marpol.com",
                    "password": "12345",
                  })),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
        ],
      ),
    );
