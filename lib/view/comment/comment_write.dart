import 'package:app/service/comment_service.dart';
import 'package:app/states/comment_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../states/post_notifier.dart';

class CommentWrite extends StatefulWidget {
  const CommentWrite(
      {Key? key,
      required this.autoFocus,
      required this.upperCmtNo,
      required this.postNo})
      : super(key: key);
  final bool autoFocus;
  final String upperCmtNo;
  final String postNo;

  @override
  State<CommentWrite> createState() => _CommentWriteState();
}

class _CommentWriteState extends State<CommentWrite> {
  final TextEditingController _commentEditingController =
      TextEditingController();

  //TODO: 작성자의 정보로 변경할것.
  final String writeName = '홍길동';

  final int holdCount = 3333;

  @override
  void dispose() {
    _commentEditingController.dispose();
    super.dispose();
  }

  Widget unFocusedContainer(context) {
    Map<dynamic, dynamic> data = {};
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 15.0.w),
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
              autofocus: widget.autoFocus,
              controller: _commentEditingController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
                  hintText: "댓글을 남겨주세요.",
                  hintStyle: TextStyle(
                      color: const Color(0xffabacb2),
                      fontSize: 13.0.sp,
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
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ),
          SizedBox(
            width: 7.0.w,
          ),
          ElevatedButton(
            onPressed: () async {
              data.putIfAbsent("postNo", () => widget.postNo);
              data.putIfAbsent("upperCmtNo", () => widget.upperCmtNo);
              data.putIfAbsent(
                  "commentText", () => _commentEditingController.value.text);

              data.putIfAbsent("writeNm", () => writeName);
              data.putIfAbsent("onskTisuCnt", () => holdCount);
              data.putIfAbsent("userId", () => "1");

              await CommentService().uploadComment(data);
              data.clear();
              _commentEditingController.clear();
              if (widget.upperCmtNo == "0") {
                await Provider.of<PostNotifier>(context, listen: false)
                    .getPost(widget.postNo);
              } else {
                await Provider.of<CommentNotifier>(context, listen: false)
                    .getComments(widget.postNo, widget.upperCmtNo);
              }
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding:
                    EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 17.0.w),
                textStyle: TextStyle(
                    fontSize: 13.0.sp,
                    color: const Color(0xffffffff),
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
    return unFocusedContainer(context);
  }
}
