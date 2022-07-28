import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.fontSize,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xff7F8088),
              decoration: TextDecoration.underline),
        ));
  }
}
