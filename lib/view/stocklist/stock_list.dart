import 'package:app/view/app_bar.dart';
import 'package:flutter/material.dart';

class StockList extends StatelessWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              AppBarContainer(
                  rightIcon: Icon(
                    Icons.all_inbox_outlined,
                    color: Color(0xff1E1E1E),
                  ),
                  title: "나의 보유 종목",
                  leftOnPressed: true,
                  leftOpacity: 1.0,
                  rightOpacity: 0.0,
                  rightOnPressed: false)
            ],
          ),
        ),
      ),
    );
  }
}
