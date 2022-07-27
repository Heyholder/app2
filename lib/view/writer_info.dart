import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriterInfo extends StatelessWidget {
  const WriterInfo(
      {Key? key,
        required this.userName,
        required this.holdCount,
        required this.createdAt})
      : super(key: key);

  final String userName;
  final int holdCount;
  final String createdAt;

  Widget nameSeparator() {
    return SizedBox(
      width: 1.0.w,
      height: 9.0.h,
      child: Container(
        color: const Color(0xffcacbd4),
      ),
    );
  }

  Widget createdTimeContainer(context, String createdTime) {
    return Text(createdTime, style: Theme.of(context).textTheme.bodySmall);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(userName, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              width: 5.0.w,
            ),
            nameSeparator(),
            SizedBox(
              width: 5.0.w,
            ),
            Text('$holdCount주', style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
        createdTimeContainer(context, createdAt)
      ],
    );
  }
}
