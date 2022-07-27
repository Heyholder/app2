import 'package:app/service/post_list_service.dart';
import 'package:app/model/postModel.dart';
import 'package:app/view/count_container.dart';
import 'package:app/view/stock_info.dart';
import 'package:app/view/writer_info.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  //TODO:stockCode api에서 받아오게 수정할 것.
  final String _stockCode = "000000";

  Widget postContentContainer(context, postContent) {
    return ExtendedText(
      postContent,
      style: Theme.of(context).textTheme.bodyLarge,
      joinZeroWidthSpace: false,
      overflowWidget: TextOverflowWidget(
        position: TextOverflowPosition.end,
        align: TextOverflowAlign.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('\u2026 '),
            Text('더보기',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.0.sp,
                  decoration: TextDecoration.underline,
                  color: const Color(0xff696c75),
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
      maxLines: 2,
    );
  }

  Widget postContainer(context, post) {
    String postTitle = '${post.postTitle}';
    String postContent = '${post.postContent}';
    int viewCount = post.viewCount;
    int likeCount = post.likeCount;
    int commentCount = post.commentCount;
    String createdTime = post.regDate;
    String userName = post.writeName;
    int holdCount = post.holdCount;

    const viewAsset = 'assets/images/ic_view.svg';
    const likeAsset = 'assets/images/ic_thumbs.svg';
    const commentAsset = 'assets/images/ic_reply.svg';

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WriterInfo(
              userName: userName,
              holdCount: holdCount,
              createdAt: createdTime,
            ),
            SizedBox(
              height: 6.0.h,
            ),
            Text(postTitle, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20.0.h,
            ),
            postContentContainer(context, postContent),
            SizedBox(
              height: 24.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountContainer(asset: viewAsset, count: viewCount),
                Row(
                  children: [
                    CountContainer(asset: likeAsset, count: likeCount),
                    SizedBox(
                      width: 20.0.w,
                    ),
                    CountContainer(asset: commentAsset, count: commentCount),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget noContentContainer() {
    return Expanded(
      child: Container(
        width: 375.0.w,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/noConent.svg',
              width: 122.0.w,
              height: 92.42.h,
            ),
            SizedBox(
              height: 40.6.h,
            ),
            Text(
              '이야기가 없어요.',
              style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff696c75)),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            Text(
              '첫 이야기를 작성해 보시는 건 어떨까요?',
              style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7F8088)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(List<PostModel> posts) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            PostModel post = posts[index];
            return postContainer(context, post);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: posts.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          StockInfo(),
          FutureBuilder<List<PostModel>>(
            future: PostListService(stockCode: _stockCode).fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return Expanded(
                    child: Container(
                        width: 375.0.w,
                        color: Colors.white,
                        child:
                            const Center(child: CircularProgressIndicator())));
              } else {
                return (snapshot.data!.isNotEmpty)
                    ? Expanded(
                        child: Scrollbar(child: _listView(snapshot.data!)))
                    : noContentContainer();
              }
            },
          )
        ],
      ),
    );
  }
}
