import 'package:app/controller/commentlist_controller.dart';
import 'package:app/view/text_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentList extends StatelessWidget {
  CommentList({
    Key? key,
  }) : super(key: key);

  final commentListController = Get.put(CommentListController());

  Widget commentContainer(context, controller, int index) {
    final String userName = controller.comments[index].userName;
    final int holdCount = controller.comments[index].holdCount;
    final String createdAt = controller.comments[index].createdAt;
    final String commentContent = controller.comments[index].commentContent;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
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
              TextButton2(text: "댓글달기", onPressed: () {}, fontSize: 12.0)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GetX<CommentListController>(
      builder: (controller) {
        return ListView.separated(
          itemCount: controller.comments.length,
          itemBuilder: (context, int index) {
            return commentContainer(context, controller, index);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    ));
  }
}
