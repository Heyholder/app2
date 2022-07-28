import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class StockInfo extends StatelessWidget {
  StockInfo({Key? key}) : super(key: key);

  //TODO: 종목명과 전체 수량 데이터로 받아올것.
  final String _stockName = '삼성전자';
  final int _stockCount = 179093480;
  final f = NumberFormat('###,###,###,###');

  Widget appBarContainer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          "assets/images/btn_alarm_w.svg",
          width: 24.0.w,
          height: 24.0.h,
        ),
        SizedBox(
          width: 20.0.w,
        ),
        SvgPicture.asset(
          "assets/images/btn_gnb_mylist_w100.svg",
          width: 24.0.w,
          height: 24.0.h,
        ),
      ],
    );
  }

  Widget stockCountContainer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _stockName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          children: [
            Text(
              f.format(_stockCount),
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
          'Heyholder 유저들의 $_stockName 총 보유수량입니다.',
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
      height: 126.0.h,
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 20.0.w),
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
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      height: 233.7.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 32.7.h,
          ),
          appBarContainer(context),
          SizedBox(
            height: 29.0.h,
          ),
          stockStatusContainer(context)
        ],
      ),
    );
  }
}
