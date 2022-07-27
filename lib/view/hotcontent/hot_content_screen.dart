import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotContentScreen extends StatelessWidget {
  const HotContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            shape: Border(bottom: BorderSide(width: 1, color: Color(0xffE5E5E5))),
            backgroundColor: Colors.white,
            title: Text(
              "핫글 모음",
              style: TextStyle(color: Color(0xff1E1E1E), fontSize: 18.0.sp),
            ),
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
