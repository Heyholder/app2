import 'package:app/service/post_detail_service.dart';
import 'package:flutter/material.dart';
import '../model/commentModel.dart';

class PostNotifier extends ChangeNotifier {
  final List<CommentModel> _comments = [];
  final Map _post = {};

  Map get post => _post;

  List<CommentModel> get comments => _comments;

  Future<void> getComments(postNo) async {
    Map data = await PostDetailService().getPost(postNo);
    _comments.clear();
    _comments.addAll(data["commentList"]);
    notifyListeners();
  }

  Future<void> getPost(postNo) async {
    _comments.clear();
    _post.clear();
    var postData = await PostDetailService().getPost(postNo);
    _post.addAll(postData);
    _comments.addAll(postData["commentList"]);
    notifyListeners();
  }
}
