import 'package:app/states/post_notifier.dart';
import 'package:app/utils/floadting_modal.dart';
import 'package:app/view/comment/comment_list.dart';
import 'package:app/view/comment/comment_write.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../custom_text_button.dart';
import '../writer_info.dart';

class PostScreen extends StatefulWidget {
  final String postNo;
  final _stockName = '삼성전자';
  final _loginId = 1;

  const PostScreen(
    this.postNo, {
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool init = false;

  @override
  void initState() {
    if (!init) {
      _onRefresh();
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    await Provider.of<PostNotifier>(context, listen: false)
        .getPost(widget.postNo);
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
        widget._stockName,
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.0.sp),
      ),
      centerTitle: true,
    );
  }

  Widget category() {
    return Text(
      '이야기방',
      style:
          Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13.0.sp),
    );
  }

  Widget headLineContainer(userId) {
    //TODO: 유저아이디 추출 하기.
    if (userId == widget._loginId) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            color: const Color(0xff696C75),
            iconSize: 25.0.r,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => showFloatingModalBottomSheet(
                context: context, builder: (context) => floatingModal()),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(),
          CustomTextButton(text: "신고하기", onPressed: () {}, fontSize: 10.0.sp),
        ],
      );
    }
  }

  Widget floatingModal() {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                "글 수정하기",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff6474ff),
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text("글 삭제하기",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xffff6b68),
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget postContainer(context, post) {
    String insId = post.insId;
    String postTitle = post.postTitle;
    String writerName = post.writerName;
    String postContent = post.postContent;
    int holdCount = post.holdCount;
    String createdAt = post.regDate;
    int likeCount = post.likeCount;
    int commentCount = post.commentCount;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:
                  BorderSide(width: 5.0.h, color: const Color(0xffE5E5E5)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headLineContainer(insId),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            postTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 6.0.h,
          ),
          WriterInfo(
            userName: writerName,
            holdCount: holdCount,
            createdAt: createdAt,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Text(
            postContent,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 13.0.sp),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/ic_thumbs.svg",
                    width: 21.0.w,
                    height: 21.0.h,
                  )),
              SizedBox(
                width: 2.0.w,
              ),
              Text(
                '$likeCount',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0xffE71915)),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              SvgPicture.asset(
                "assets/images/ic_reply.svg",
                width: 21.0.w,
                height: 21.0.h,
              ),
              SizedBox(
                width: 2.0.w,
              ),
              Text(
                '$commentCount',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0xffE71915)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostNotifier>(context).post;
    final comments = Provider.of<PostNotifier>(context).comments;
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
                  child: (postData.isNotEmpty)
                      ? RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  postContainer(context, postData["post"]),
                                  CommentList(comments: comments)
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 375.0.w,
                          color: Colors.white,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )),
              CommentWrite(
                autoFocus: false,
                upperCmtNo: "0",
                postNo: widget.postNo,
              )
            ],
          ),
        )),
      ),
    );
  }
}
