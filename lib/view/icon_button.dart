import 'package:flutter/material.dart';

class IconButton2 extends StatelessWidget {
  const IconButton2(
      {Key? key,
      required this.iconSize,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final double iconSize;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: icon,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
