import 'package:app/controller/commentlist_controller.dart';
import 'package:app/controller/commentwrite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/postdetail_controller.dart';

class CommentWrite extends StatelessWidget {
  const CommentWrite(
      {Key? key, required this.autoFocus, required this.upperCmtNo})
      : super(key: key);
  final bool autoFocus;
  final int upperCmtNo;

  Widget unFocusedContainer(controller) {
    final PostDetailController postDetailController = Get.find();
    final CommentListController commentListController = Get.find();
    CommentWriteController commentWriteController =
        Get.put(CommentWriteController());
    final int postNo = postDetailController.post.single.id;

    Future<void> postDetailUpdate() async {
      await postDetailController.fetchData(postDetailController.post.single.id);
    }

    Future<void> commentListUpdate() async {
      await commentListController.fetchData(
          postDetailController.post.single.id, upperCmtNo);
    }

    Map<dynamic, dynamic> data = {};
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 6,
            color: const Color(0xffB1B1B1).withOpacity(0.16))
      ]),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              controller: commentWriteController.commentEditingController.value,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 14.0),
                  hintText: "댓글을 남겨주세요.",
                  hintStyle: const TextStyle(
                      color: Color(0xffabacb2),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  fillColor: const Color(0xfff8f8f8),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      borderSide: const BorderSide(color: Color(0xfff8f8f8))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      borderSide: const BorderSide(color: Color(0xfff8f8f8)))),
              minLines: 1,
              maxLines: 10,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            width: 7.0,
          ),
          ElevatedButton(
            onPressed: () async {
              data.putIfAbsent("postNo", () => postNo);
              data.putIfAbsent("upperCmtNo", () => upperCmtNo);
              data.putIfAbsent(
                  "commentText",
                  () => commentWriteController
                      .commentEditingController.value.text);
              data.putIfAbsent(
                  "writeNm", () => postDetailController.post.single.userName);
              data.putIfAbsent("onskTisuCnt",
                  () => postDetailController.post.single.holdCount);
              data.putIfAbsent("userId", () => "1");

              await commentWriteController.fetchData(data);
              commentWriteController.commentEditingController.value.clear();
              data.clear();
              await postDetailController
                  .fetchData(postDetailController.post.single.id);
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
                textStyle: const TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400),
                primary: const Color(0xffe71915),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0))),
            child: const Text("등록"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final commentWriteController = Get.put(CommentWriteController());
    return unFocusedContainer(commentWriteController);
  }
}
