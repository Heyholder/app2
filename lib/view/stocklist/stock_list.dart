import 'package:app/view/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockList extends StatelessWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              AppBarContainer(
                  title: "나의 보유 종목",
                  onPressedBack: () {
                    Get.back();
                  },
                  stockListOpacity: 0.0,
                  stockListOnPressed: false)
            ],
          ),
        ),
      ),
    );
  }
}
