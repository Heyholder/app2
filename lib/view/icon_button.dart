import 'package:flutter/material.dart';

class IconButton2 extends StatelessWidget {
  IconButton2(
      {required this.iconSize, required this.icon, required this.onPressed});

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
