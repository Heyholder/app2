import 'package:app/service/comment_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/commentModel.dart';

class CommentNotifier extends ChangeNotifier {
  final List<CommentModel> _comments = [];

  List<CommentModel> get comments => _comments;

  Future<void> getComments(String postNo, String commentNo) async {
    _comments.clear();
    _comments.addAll(await CommentService().getComments(postNo, commentNo));
    notifyListeners();
  }
}
