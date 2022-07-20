import 'package:app/controller/postdetail_controller.dart';
import 'package:app/controller/postlist_controller.dart';
import 'package:app/view/app_bar.dart';
import 'package:app/view/icon_button.dart';
import 'package:app/view/text_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comment_list.dart';
import 'comment_write.dart';

class PostDetail extends StatelessWidget {
  PostDetail({Key? key}) : super(key: key);

  final PostDetailController postDetailController = Get.find();
  final PostListController postListController = Get.find();

  final title = '삼성전자';

  Widget category() {
    return const Text(
      '이야기방',
      style: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
          color: Color(0xff1E1E1E)),
    );
  }

  Widget headLineContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        category(),
        TextButton2(text: "신고하기", onPressed: () {}, fontSize: 13.0)
      ],
    );
  }

  Widget postContainer(context, controller) {
    String postTitle = controller.post.single.postTitle;
    String userName = controller.post.single.userName;
    String postContent = controller.post.single.postContent;
    int holdCount = controller.post.single.holdCount;
    String createdAt = controller.post.single.createdAt;
    int likeCount = controller.post.single.likeCount;
    int commentCount = controller.post.single.commentCount;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xffE5E5E5)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headLineContainer(),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            postTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 6.0,
          ),
          WriterInfo(
            userName: userName,
            holdCount: holdCount,
            createdAt: createdAt,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            postContent,
            style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff1e1e1e)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton2(
                  iconSize: 17.0,
                  icon: const Icon(
                    Icons.thumb_up_outlined,
                    color: Color(0xff696C75),
                  ),
                  onPressed: () {}),
              const SizedBox(
                width: 2,
              ),
              Text(
                '$likeCount',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                size: 17.0,
                Icons.comment_outlined,
                color: const Color(0xff696c75),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '$commentCount',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    await postListController.fetchData("000000");
                    Get.back();
                  }),
              Obx(() {
                if (postDetailController.post.isNotEmpty) {
                  return Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            postContainer(context, postDetailController),
                            CommentList(controller: postDetailController,),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              CommentWrite(autoFocus: false, upperCmtNo: 0,)
            ],
          ),
        )),
      ),
    );
  }
}
