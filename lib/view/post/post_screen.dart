import 'package:app/service/post_detail_service.dart';
import 'package:app/view/comment/comment_list.dart';
import 'package:app/view/comment/comment_write.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        style: TextStyle(
            color: const Color(0xff1E1E1E),
            fontSize: 18.0.sp,
            fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
    );
  }

  Widget category() {
    return Text(
      '이야기방',
      style: TextStyle(
          fontSize: 13.0.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1E1E1E)),
    );
  }

  Widget headLineContainer(userId) {
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
            onPressed: () {},
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(),
        ],
      );
    }
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
            style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff1e1e1e)),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 2.0.w,
              ),
              Text(
                '$likeCount',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Icon(
                size: 17.0.r,
                Icons.comment_outlined,
                color: const Color(0xff696c75),
              ),
              SizedBox(
                width: 2.0.w,
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
              FutureBuilder<Map>(
                  future: PostDetailService().getPost(widget.postNo),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) {
                      return Expanded(
                          child: Container(
                        width: 375.0.w,
                        color: Colors.white,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ));
                    } else {
                      return Expanded(
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                postContainer(context, snapshot.data!["post"]),
                                CommentList(
                                    comments: snapshot.data!["commentList"]),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }),
              CommentWrite(
                autoFocus: false,
                upperCmtNo: 0,
                postNo: widget.postNo,
              )
            ],
          ),
        )),
      ),
    );
  }
}
