import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {Key? key,
      required this.title,
      required this.leftOnPressed,
      required this.rightOpacity,
      required this.rightOnPressed,
      required this.leftOpacity,
      required this.rightIcon})
      : super(key: key);

  final String title;
  final double rightOpacity;
  final double leftOpacity;
  final bool leftOnPressed;
  final bool rightOnPressed;
  final Icon rightIcon;

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
          Opacity(
              opacity: leftOpacity,
              child: IconButton(
                  iconSize: 25.0,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff1E1E1E),
                  ),
                  onPressed: leftOnPressed
                      ? () {
                          Get.back();
                        }
                      : null,
                  constraints: const BoxConstraints())),
          titleContainer(),
          Opacity(
              opacity: rightOpacity,
              child: IconButton(
                  iconSize: 25.0,
                  icon: rightIcon,
                  onPressed: rightOnPressed ? () {} : null,
                  constraints: const BoxConstraints())),
        ],
      ),
    );
  }
}
