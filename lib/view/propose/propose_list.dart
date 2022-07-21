import 'package:app/view/stock_info.dart';
import 'package:flutter/material.dart';

class ProposeList extends StatelessWidget {
  const ProposeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [StockInfo()],
          ),
        ),
      ),
    );
  }
}
