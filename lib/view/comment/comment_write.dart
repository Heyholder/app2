import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWrite extends StatelessWidget {
  CommentWrite(
      {Key? key,
      required this.autoFocus,
      required this.upperCmtNo,
      required this.postNo})
      : super(key: key);
  final bool autoFocus;
  final int upperCmtNo;
  final String postNo;
  final TextEditingController commentEditingController =
      TextEditingController();

  final String writeName = '홍길동';
  final int holdCount = 3333;

  Widget unFocusedContainer() {
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
              autofocus: autoFocus,
              controller: commentEditingController,
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
              maxLines: 10,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(
            width: 7.0.w,
          ),
          ElevatedButton(
            onPressed: () async {
              data.putIfAbsent("postNo", () => postNo);
              data.putIfAbsent("upperCmtNo", () => upperCmtNo);
              data.putIfAbsent(
                  "commentText",
                  () => commentEditingController.value.text);
              //TODO: 작성자의 정보로 변경할것.
              data.putIfAbsent(
                  "writeNm", () => writeName);
              data.putIfAbsent("onskTisuCnt",
                  () => holdCount);
              data.putIfAbsent("userId", () => "1");
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
    return unFocusedContainer();
  }
}
