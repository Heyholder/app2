import 'package:app/service/comment_revise_service.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentReviseScreen extends StatefulWidget {
  const CommentReviseScreen({
    Key? key,
    required this.commentNo,
  }) : super(key: key);
  final String commentNo;

  @override
  State<CommentReviseScreen> createState() => _CommentReviseScreenState();
}

class _CommentReviseScreenState extends State<CommentReviseScreen> {
  final TextEditingController _commentEditingController =
      TextEditingController();

  @override
  void dispose() {
    _commentEditingController.dispose();
    super.dispose();
  }

  Widget appbarContainer(postNo) {
    return AppBar(
      elevation: 0,
      shape: Border(
          bottom: BorderSide(width: 1.0.w, color: const Color(0xffE5E5E5))),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: const Color(0xff1E1E1E),
          size: 30.0.r,
        ),
        onPressed: () {
          Beamer.of(context).beamBack();
        },
      ),
      actions: [
        TextButton(
            onPressed: (_commentEditingController.text != "")
                ? () => reviseComment(postNo)
                : null,
            child: Text(
              "완료",
              style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w500),
            ))
      ],
      title: Text(
        "댓글 수정",
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.0.sp),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map commentData = context.currentBeamLocation.data as Map;
    _commentEditingController.text = commentData["commentContent"];
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appbarContainer(commentData["postNo"]),
              Expanded(
                  child: TextFormField(
                autofocus: true,
                controller: _commentEditingController,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w)),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> reviseComment(postNo) async {
    Map<dynamic, dynamic> data = {};
    //TODO: 로그인 아이디 추출할것.
    data.putIfAbsent("userId", () => "1");
    data.putIfAbsent("postNo", () => postNo);
    data.putIfAbsent("commentText", () => _commentEditingController.text);
    data.putIfAbsent("commentNo", () => widget.commentNo);
    await CommentReviseService().reviseComment(widget.commentNo, data);
    Beamer.of(context).beamBack();
  }
}
