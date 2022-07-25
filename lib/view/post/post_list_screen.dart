import 'package:app/states/auth_notifier.dart';
import 'package:app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d(context.watch<AuthenticationNotifier>().isAuthenticated);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Container(
            child: ElevatedButton(onPressed: (){
              context.read<AuthenticationNotifier>().setUserAuth(false);
            }, child: Text("로그아웃")),
          ),
        ),
      ),
    );
  }
}
