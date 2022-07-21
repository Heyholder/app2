import 'package:app/controller/postdetail_controller.dart';
import 'package:app/controller/postlist_controller.dart';
import 'package:app/view/count_container.dart';
import 'package:app/view/post/post_detail.dart';
import 'package:app/view/stock_info.dart';
import 'package:app/view/writer_info.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PostList extends StatelessWidget {
  PostList({Key? key}) : super(key: key);

  final String stockName = '삼성전자';
  final int stockCount = 179093480;
  final f = NumberFormat('###,###,###,###');

  Widget createdTimeContainer(context, String createdTime) {
    return Text(createdTime, style: Theme.of(context).textTheme.bodySmall);
  }

  Widget postContentContainer(postContent) {
    return ExtendedText(
      postContent,
      style: const TextStyle(
        fontFamily: 'Noto_Sans_KR',
        fontSize: 13,
        color: Color(0xff696c75),
        fontWeight: FontWeight.w400,
      ),
      joinZeroWidthSpace: false,
      overflowWidget: TextOverflowWidget(
        position: TextOverflowPosition.end,
        align: TextOverflowAlign.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('\u2026 '),
            InkWell(
              child: Text('더보기',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: Color(0xff696c75),
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      maxLines: 2,
    );
  }

  Widget postContainer(context, controller, detailController, index) {
    int postId = controller.posts[index].id;
    String postTitle = '${controller.posts[index].postTitle}';
    String postContent = '${controller.posts[index].postContent}';
    int viewCount = controller.posts[index].viewCount;
    int likeCount = controller.posts[index].likeCount;
    int commentCount = controller.posts[index].commentCount;
    String createdTime = controller.posts[index].createdAt;
    String userName = controller.posts[index].userName;
    int holdCount = controller.posts[index].holdCount;

    const viewAsset = 'assets/images/ic_view.svg';
    const likeAsset = 'assets/images/ic_thumbs.svg';
    const commentAsset = 'assets/images/ic_reply.svg';

    return InkWell(
      onTap: () async {
        await detailController.fetchData(postId);
        Get.to(() => PostDetail());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WriterInfo(
              userName: userName,
              holdCount: holdCount,
              createdAt: createdTime,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(postTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 20,
            ),
            postContentContainer(postContent),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountContainer(asset: viewAsset, count: viewCount),
                Row(
                  children: [
                    CountContainer(asset: likeAsset, count: likeCount),
                    const SizedBox(
                      width: 20,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/noConent.svg',
          width: 122.0,
          height: 92.42,
        ),
        const SizedBox(
          height: 40.6,
        ),
        const Text(
          '이야기가 없어요.',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff696c75)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          '첫 이야기를 작성해 보시는 건 어떨까요?',
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Color(0xff7F8088)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final postDetailController = Get.put(PostDetailController());
    final postListController = Get.put(PostListController());

    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              StockInfo(),
              Obx(() {
                if (postListController.posts.isNotEmpty) {
                  return Expanded(
                      child: Scrollbar(
                    child: ListView.separated(
                      itemCount: postListController.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return postContainer(context, postListController,
                            postDetailController, index);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ));
                } else {
                  return noContentContainer();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
