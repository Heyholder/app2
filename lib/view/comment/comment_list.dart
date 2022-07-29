import 'package:app/view/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/commentModel.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, required this.comments}) : super(key: key);
  final List<CommentModel> comments;

  @override
  ListView build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        CommentModel comment = comments[index];
        return Comment(
          comment: comment,
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1.0.h,
        thickness: 1.0.h,
      ),
    );
  }
}
