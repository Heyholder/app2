import 'package:app/controller/postdetail_controller.dart';
import 'package:app/view/comment_write.dart';
import 'package:app/view/icon_button.dart';
import 'package:app/view/text_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key}) : super(key: key);

  final stockName = '삼성전자';

  Widget stockNameContainer() {
    return Text(
      stockName,
      style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Color(0xff1e1e1e)),
    );
  }

  Widget appBarContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 54.0,
      decoration: const BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 1.0, color: Color(0xffE5E5E5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton2(
              iconSize: 25.0,
              icon: const Icon(Icons.arrow_back, color: Color(0xff1E1E1E)),
              onPressed: () {
                Get.back();
              }),
          stockNameContainer(),
          IconButton2(
              iconSize: 25.0,
              icon: const Icon(
                Icons.all_inbox_outlined,
                color: Color(0xff1E1E1E),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

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
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PostDetailController postDetailController = Get.find();

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                appBarContainer(),
                Obx(() {
                  if (postDetailController.post.isNotEmpty) {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: postContainer(context, postDetailController),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                CommentWrite()
              ],
            ),
          )),
    );
  }
}
