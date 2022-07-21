import 'package:app/controller/navigation_controller.dart';
import 'package:app/view/post/post_list.dart';
import 'package:app/view/propose/propose_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  NavigationPage({Key? key}) : super(key: key);

  final screen = [PostList(), ProposeList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: navigationController.selectedIndex.value,
              children: screen,
            )),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xffe71915),
            unselectedItemColor: const Color(0xffB9BAC5),
            backgroundColor: const Color(0xffFFFFFF),
            iconSize: 22.0,
            selectedFontSize: 9.0,
            unselectedFontSize: 9.0,
            onTap: (index) {
              navigationController.changeIndex(index);
            },
            currentIndex: navigationController.selectedIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded), label: "이야기방"),
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: "주주제안"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_note), label: "글쓰기"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department), label: "핫글"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: "내정보")
            ],
          ),
        ));
  }
}
