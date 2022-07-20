import 'package:flutter/material.dart';
import 'package:app/view/icon_button.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {Key? key, required this.title, required this.onPressedBack})
      : super(key: key);

  final String title;
  final VoidCallback onPressedBack;

  Widget titleContainer() {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Color(0xff1e1e1e)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 54.0,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xffE5E5E5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton2(
              iconSize: 25.0,
              icon: const Icon(Icons.arrow_back, color: Color(0xff1E1E1E)),
              onPressed: onPressedBack),
          titleContainer(),
          IconButton2(
              iconSize: 25.0,
              icon: const Icon(
                Icons.all_inbox_outlined,
                color: Color(0xff1E1E1E),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
