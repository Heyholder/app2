import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountContainer extends StatelessWidget {
  const CountContainer({Key? key, required this.asset, required this.count})
      : super(key: key);

  final String asset;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: 20.0.w,
          height: 20.0.h,
        ),
        SizedBox(
          width: 2.0.w,
        ),
        Text(
          '$count',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
