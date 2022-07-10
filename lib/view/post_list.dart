import 'package:app/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PostList extends StatelessWidget {
  PostList({Key? key}) : super(key: key);
  final postController = Get.put(PostController());
  final String stockName = '삼성전자';
  final int stockCount = 179093480;
  final f = NumberFormat('###,###,###,###');

  Widget alarmIconButton(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/images/btn_alarm_w.svg',
        ));
  }

  Widget stockListButton(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: SvgPicture.asset('assets/images/btn_gnb_mylist_w.svg'));
  }

  Widget appBarContainer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        alarmIconButton(context),
        const SizedBox(
          width: 20,
        ),
        stockListButton(context)
      ],
    );
  }

  Widget stockCountContainer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          stockName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          children: [
            Text(
              f.format(stockCount),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              '주',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        )
      ],
    );
  }

  Widget explainContainer(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heyholder 유저들의 $stockName 총 보유수량입니다.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '매일 밤 1시에 업데이트 됩니다.',
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }

  Widget stockStatusContainer(context) {
    return Container(
      height: 126.0,
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [stockCountContainer(context), explainContainer(context)],
        ),
      ),
    );
  }

  Widget headContainer(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 203.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          appBarContainer(context),
          const SizedBox(
            height: 15,
          ),
          stockStatusContainer(context)
        ],
      ),
    );
  }

  Widget nameSeparator() {
    return SizedBox(
      width: 1,
      height: 9,
      child: Container(
        color: const Color(0xffcacbd4),
      ),
    );
  }

  Widget writerInfoContainer(context, userName, holdCount) {
    return Row(
      children: [
        Text(userName, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          width: 5.0,
        ),
        nameSeparator(),
        const SizedBox(
          width: 5.0,
        ),
        Text('$holdCount주', style: Theme.of(context).textTheme.titleSmall)
      ],
    );
  }

  Widget createdTimeContainer(context, createdTime) {
    return Text(createdTime, style: Theme.of(context).textTheme.bodySmall);
  }

  Widget viewCountContainer(context, viewCount) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/ic_view.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          '$viewCount',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }

  Widget likeCountContainer(context, likeCount) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/ic_thumbs.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          '$likeCount',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }

  Widget commentCountContainer(context, commentCount) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/ic_reply.svg',
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          '$commentCount',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }

  Widget postContainer(context, controller, index) {
    String postTitle = '${controller.posts[index].postTitle}';
    String postContent = '${controller.posts[index].postContent}';
    int viewCount = controller.posts[index].viewCount;
    int likeCount = controller.posts[index].likeCount;
    int commentCount = controller.posts[index].commentCount;
    String createdTime = controller.posts[index].createdAt;
    String userName = controller.posts[index].userName;
    int holdCount = 0;

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Theme.of(context).dividerColor))),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              writerInfoContainer(context, userName, holdCount),
              createdTimeContainer(context, createdTime)
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(postTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          Text(
            postContent,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              viewCountContainer(context, viewCount),
              Row(
                children: [
                  likeCountContainer(context, likeCount),
                  const SizedBox(
                    width: 20,
                  ),
                  commentCountContainer(context, commentCount)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            headContainer(context),
            Expanded(child: GetX<PostController>(builder: (controller) {
              return Scrollbar(
                child: ListView.builder(
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      return postContainer(context, controller, index);
                    }),
              );
            }))
          ],
        ),
      ),
    );
  }
}
