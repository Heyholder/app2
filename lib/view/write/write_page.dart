import 'package:flutter/material.dart';
import 'package:app/view/app_bar.dart';

class WritePage extends StatelessWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              AppBarContainer(
                  title: "글쓰기",
                  leftOnPressed: true,
                  leftOpacity: 1.0,
                  rightOnPressed: false,
                  rightOpacity: 0.0,
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
