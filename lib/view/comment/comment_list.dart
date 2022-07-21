import 'package:app/controller/postdetail_controller.dart';
import 'package:app/view/comment/comment_container.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    Key? key, required this.controller,
  }) : super(key: key);

  final PostDetailController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.comments.isNotEmpty) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.comments.length,
        itemBuilder: (BuildContext context, int index) {
          return CommentContainer(index: index, postDetailController: controller,);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    } else {
      return Container();
    }
  }
}
