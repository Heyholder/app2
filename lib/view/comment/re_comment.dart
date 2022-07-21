import 'package:app/controller/commentlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/view/text_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:get/get.dart';

class ReCommentContainer extends StatelessWidget {
  ReCommentContainer({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final CommentListController commentListController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    final String userName = commentListController.comments[index].userName;
    final int holdCount = commentListController.comments[index].holdCount;
    final String createdAt = commentListController.comments[index].createdAt;
    final String commentContent =
        commentListController.comments[index].commentContent;
    final int parentNo = commentListController.comments[index].parentCommentId;

    return Container(
      padding: parentNo == 0
          ? const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0)
          : const EdgeInsets.fromLTRB(30.0, 18.0, 15.0, 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterInfo(
              userName: userName, holdCount: holdCount, createdAt: createdAt),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            commentContent,
            style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff1E1E1E)),
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton2(text: "신고하기", onPressed: () {}, fontSize: 12.0),
              const SizedBox(
                width: 16.0,
              ),
              TextButton2(
                  text: "댓글달기",
                  onPressed: () {
                    Get.to(() => {});
                  },
                  fontSize: 12.0)
            ],
          )
        ],
      ),
    );
  }
}
