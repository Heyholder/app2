import 'package:app/view/writer_info.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList(
      {Key? key,
      required this.userName,
      required this.holdCount,
      required this.createdTime,
      required this.commentContent})
      : super(key: key);

  final String userName;
  final int holdCount;
  final String createdTime;
  final String commentContent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WriterInfo(
                userName: userName,
                holdCount: holdCount,
                createdTime: createdTime),
            const SizedBox(
              height: 9.0,
            ),
            Text(commentContent),
            const SizedBox(
              height: 9.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [TextButton(onPressed: onPressed, child: child)],
            )
          ],
        ),
      ),
    );
  }
}
