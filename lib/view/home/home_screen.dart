import 'package:app/view/hotcontent/hot_content_screen.dart';
import 'package:app/view/myinfo/my_info.dart';
import 'package:app/view/post/post_list_screen.dart';
import 'package:app/view/propose/propose_list_screen.dart';
import 'package:app/view/write/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _bottomSelectedIndex,
          children: const [
            PostListScreen(),
            ProposeListScreen(),
            WriteScreen(),
            HotContentScreen(),
            MyInfoScreen()
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color(0xffababab).withOpacity(0.16),
                blurRadius: 6,
                offset: const Offset(0, -1))
          ]),
          child: BottomNavigationBar(
            currentIndex: _bottomSelectedIndex,
            onTap: (index) {
              setState(() {
                _bottomSelectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _bottomSelectedIndex == 0
                        ? "assets/images/selected_chat.svg"
                        : "assets/images/unselected_chat.svg",
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  label: "이야기방"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _bottomSelectedIndex == 1
                        ? "assets/images/selected_proposal.svg"
                        : "assets/images/unselected_proposal.svg",
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  label: "주주제안"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/unselected_write.svg",
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  label: "글쓰기"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _bottomSelectedIndex == 3
                        ? "assets/images/selected_hot.svg"
                        : "assets/images/unselected_hot.svg",
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  label: "핫글"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _bottomSelectedIndex == 4
                        ? "assets/images/selected_my.svg"
                        : "assets/images/unselected_my.svg",
                    width: 30.0.w,
                    height: 30.0.h,
                  ),
                  label: "내정보")
            ],
          ),
        ),
      ),
    );
  }
}
