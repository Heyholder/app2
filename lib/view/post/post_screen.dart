import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String postNo;

  const PostScreen(
    this.postNo, {
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amberAccent,
          child: Text(widget.postNo),
        ),
      ),
    );
  }
}
