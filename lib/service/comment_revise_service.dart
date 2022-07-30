import 'package:app/utils/logger.dart';
import 'package:app/utils/network.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CommentReviseService {
  Future<void> reviseComment(commentNo, data) async {
    String ip = "";
    ip = ipAddress();
    final uri = Uri.parse('$ip/api/v1/post-comment/$commentNo');
    final response = await Dio()
        .putUri(uri,
            data: jsonEncode(data),
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            }))
        .catchError((e) {
      logger.e(e.message);
    });
  }
}
