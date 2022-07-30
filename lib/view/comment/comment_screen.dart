import 'package:app/states/comment_notifier.dart';
import 'package:app/view/comment/comment_list.dart';
import 'package:app/view/comment/comment_write.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final String commentNo;
  final String postNo;

  const CommentScreen({Key? key, required this.commentNo, required this.postNo})
      : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool init = false;

  @override
  void initState() {
    if (!init) {
      _onRefresh();
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    await Provider.of<CommentNotifier>(context, listen: false)
        .getComments(widget.postNo, widget.commentNo);
  }

  Widget appbarContainer() {
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
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/images/btn_gnb_mylist_k.svg",
          ),
          iconSize: 30.0.r,
        )
      ],
      title: Text(
        "댓글 달기",
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.0.sp),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final comments = Provider.of<CommentNotifier>(context).comments;
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
                  appbarContainer(),
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                          child: CommentList(comments: comments)),
                    ),
                  )),
                  CommentWrite(
                      autoFocus: true,
                      upperCmtNo: widget.commentNo,
                      postNo: widget.postNo)
                ],
              ),
            ),
          ),
        ));
  }
}
