import 'package:app/view/app_bar.dart';
import 'package:flutter/material.dart';

class HotList extends StatelessWidget {
  const HotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              AppBarContainer(
                  title: "핫글 모음",
                  leftOnPressed: false,
                  rightOpacity: 1.0,
                  rightOnPressed: true,
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
