import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded), label: "이야기방"),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: "주주제안"),
        BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: "글쓰기"),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department), label: "핫글"),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "내정보")
      ],
      selectedItemColor: const Color(0xffe71915),
      unselectedItemColor: const Color(0xffB9BAC5),
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xffFFFFFF),
      iconSize: 22.0,
      selectedFontSize: 9.0,
      unselectedFontSize: 9.0,
    );
  }
}
