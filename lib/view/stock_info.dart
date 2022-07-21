import 'package:app/view/icon_button.dart';
import 'package:app/view/stocklist/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'alarm/alarm_list.dart';

class StockInfo extends StatelessWidget {
  StockInfo({Key? key}) : super(key: key);

  final String stockName = '삼성전자';
  final int stockCount = 179093480;
  final f = NumberFormat('###,###,###,###');

  Widget appBarContainer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton2(
            iconSize: 25.0,
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const AlarmList());
            }),
        const SizedBox(
          width: 20,
        ),
        IconButton2(
            iconSize: 25.0,
            icon: const Icon(
              Icons.all_inbox_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const StockList());
            }),
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

  @override
  Widget build(BuildContext context) {
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
}
