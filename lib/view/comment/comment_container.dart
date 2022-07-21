import 'package:app/controller/commentlist_controller.dart';
import 'package:app/controller/postdetail_controller.dart';
import 'package:app/view/comment/re_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:app/view/text_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:get/get.dart';

class CommentContainer extends StatelessWidget {
  CommentContainer({
    Key? key,
    required this.index,
    required this.postDetailController,
  }) : super(key: key);

  final int index;

  final PostDetailController postDetailController;
  final CommentListController commentListController =
      Get.put(CommentListController());

  @override
  Widget build(BuildContext context) {
    final int postNo = postDetailController.post.single.id;
    final int commentNo = postDetailController.comments[index].id;
    final int parentNo = postDetailController.comments[index].parentCommentId;
    final String userName = postDetailController.comments[index].userName;
    final int holdCount = postDetailController.comments[index].holdCount;
    final String createdAt = postDetailController.comments[index].createdAt;
    final String commentContent =
        postDetailController.comments[index].commentContent;

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
                  onPressed: () async {
                    await commentListController.fetchData(postNo, commentNo);
                    Get.to(() => ReCommentList(
                          commentNo: commentNo,
                        ));
                  },
                  fontSize: 12.0)
            ],
          )
        ],
      ),
    );
  }
}
