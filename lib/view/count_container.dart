import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountContainer extends StatelessWidget {
  CountContainer({required this.asset, required this.count});

  final String asset;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          '$count',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
