import 'package:app/controller/postdetail_controller.dart';

import 'package:app/view/icon_button.dart';
import 'package:app/view/writer_info.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PostDetail extends StatelessWidget {
  PostDetail({Key? key}) : super(key: key);

  final postDetailController = Get.put(PostDetailController());
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

  Widget reportButton() {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: const Text(
          '신고하기',
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: Color(0xff7F8088),
              decoration: TextDecoration.underline),
        ));
  }

  Widget headLineContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [category(), reportButton()],
    );
  }

  Widget createdTimeContainer(context, String createdTime) {
    return Text(createdTime, style: Theme.of(context).textTheme.bodySmall);
  }

  Widget postContainer(context, controller) {
    String postTitle = controller.post[0].postTitle;
    String userName = controller.post[0].userName;
    int holdCount = controller.post[0].holdCount;
    String createdTime = controller.post[0].createdAt;
    String postContent = controller.post[0].postContent;
    int likeCount = controller.post[0].likeCount;
    int commentCount = controller.post[0].commentCount;

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
          WriterInfo(userName: userName, holdCount: holdCount, createdTime: createdTime,),
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
                color: Color(0xff696c75),
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
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            appBarContainer(),
            Expanded(
              child: GetX<PostDetailController>(
                builder: (controller) {
                  return Scrollbar(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return postContainer(context, controller);
                    },
                    itemCount: controller.post.length,
                  ));
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
