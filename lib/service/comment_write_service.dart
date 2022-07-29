import 'dart:convert';

import 'package:app/utils/logger.dart';
import 'package:app/utils/network.dart';
import 'package:dio/dio.dart';

class CommentWriteService {
  Future<void> uploadComment(data) async {
    String ip = "";
    ip = ipAddress();
    final uri = Uri.parse('$ip/api/v1/post-comment');
    final response = await Dio()
        .postUri(uri,
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
