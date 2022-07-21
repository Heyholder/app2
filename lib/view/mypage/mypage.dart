import 'package:flutter/material.dart';
import 'package:app/view/app_bar.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              AppBarContainer(
                  title: "내정보",
                  leftOnPressed: false,
                  rightOpacity: 0.0,
                  rightOnPressed: false,
                  leftOpacity: 0.0,
                  rightIcon: Icon(
                    Icons.notifications_outlined,
                    color: Color(0xff1E1E1E),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
