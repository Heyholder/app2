import 'package:app/controller/commentlist_controller.dart';
import 'package:app/view/app_bar.dart';
import 'package:app/view/re_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'comment_write.dart';

class ReCommentList extends StatelessWidget {
  const ReCommentList({Key? key, required this.commentNo}) : super(key: key);
  final int commentNo;
  final String title = "댓글 달기";

  @override
  Widget build(BuildContext context) {
    CommentListController commentListController = Get.find();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                AppBarContainer(
                    title: title,
                    onPressedBack: () async {
                      Get.back();
                    }),
                Obx(() {
                  return Expanded(
                      child: Scrollbar(
                    child: SingleChildScrollView(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ReCommentContainer(index: index);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: commentListController.comments.length)),
                  ));
                }),
                CommentWrite(
                  autoFocus: true,
                  upperCmtNo: commentNo,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
