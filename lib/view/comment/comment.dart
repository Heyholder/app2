import 'package:app/model/commentModel.dart';
import 'package:app/router/locations.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../service/comment_service.dart';
import '../../states/post_notifier.dart';
import '../custom_text_button.dart';
import '../writer_info.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key, required this.comment}) : super(key: key);
  final CommentModel comment;

  //TODO: 사용자 아이디 추출할것.
  final _loginId = "1";

  Widget ownWritingContainer(context, comment) {
    final String writerId = comment.insId;
    final String postNo = comment.postNo;
    final String? commentNo = comment.commentNo;
    final String? commentContent = comment.commentContent;

    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      CustomTextButton(
          text: "수정",
          onPressed: () {
            Beamer.of(context).beamToNamed('/$locationCommentRevise/$commentNo',
                data: {
                  "writeId": writerId,
                  "postNo": postNo,
                  "commentContent": commentContent
                });
          },
          fontSize: 10.0.sp),
      SizedBox(
        width: 16.0.w,
      ),
      CustomTextButton(
          text: "삭제",
          //TODO: 대댓글 창에서 삭제시 행동 넣기.
          onPressed: () async {
            CommentService().deleteComment(commentNo);
            await Provider.of<PostNotifier>(context, listen: false)
                .getPost(postNo);
          },
          fontSize: 10.0.sp)
    ]);
  }

  Widget someoneWritingContainer(context, comment) {
    final String postNo = comment.postNo;
    final String? commentNo = comment.commentNo;
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      CustomTextButton(text: "신고하기", onPressed: () {}, fontSize: 10.0.sp),
      SizedBox(
        width: 16.0.w,
      ),
      CustomTextButton(
          text: "댓글달기",
          onPressed: () {
            Beamer.of(context)
                .beamToNamed('/$locationComment/$postNo/$commentNo');
          },
          fontSize: 10.0.sp)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final String? writerId = comment.insId;
    final String? parentNo = comment.parentCommentNo;
    final String? writerName = comment.writerName;
    final int? holdCount = comment.holdCount;
    final String? regDate = comment.regDate;
    final String? commentContent = comment.commentContent;

    return Container(
      padding: parentNo == "0"
          ? EdgeInsets.symmetric(vertical: 19.0.h, horizontal: 15.0.w)
          : EdgeInsets.fromLTRB(30.0.w, 18.0.h, 15.0.w, 18.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterInfo(
              userName: writerName!,
              holdCount: holdCount!,
              createdAt: regDate!),
          SizedBox(
            height: 9.0.h,
          ),
          Text(
            commentContent!,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 12.0.sp),
          ),
          SizedBox(
            height: 9.0.h,
          ),
          (writerId == _loginId)
              ? ownWritingContainer(context, comment)
              : someoneWritingContainer(context, comment)
        ],
      ),
    );
  }
}
