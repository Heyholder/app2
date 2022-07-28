import 'package:app/model/commentModel.dart';
import 'package:app/model/postModel.dart';
import 'package:app/utils/logger.dart';
import 'package:dio/dio.dart';
import '../utils/network.dart';

class PostDetailService {
  Future<Map> getPost(String postNo) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post/$postNo/2');

    final response = await Dio().getUri(uri).catchError((e) {
      logger.e(e.message);
    });
    PostModel postData = PostModel.fromJson(response.data["body"]);
    List<dynamic> commentData = response.data["list"];
    List<CommentModel> commentList = List<CommentModel>.from(
        commentData.map((data) => CommentModel.fromJson(data)).toList());
    Map data = {"post":postData, "commentList":commentList};
    return data;
  }
}
