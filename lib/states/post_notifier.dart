import 'package:app/service/post_detail_service.dart';
import 'package:flutter/material.dart';

class PostNotifier extends ChangeNotifier {
  final Map _post = {};

  Map get post => _post;

  Future<void> getPost(postNo) async {
    _post.clear();
    _post.addAll(await PostDetailService().getPost(postNo));
    notifyListeners();
  }
}
