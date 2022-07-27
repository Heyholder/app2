import 'package:app/view/stock_info.dart';
import 'package:flutter/material.dart';

class ProposeListScreen extends StatelessWidget {
  const ProposeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [StockInfo()],
      ),
    );
  }
}
