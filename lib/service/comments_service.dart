import 'package:app/model/commentModel.dart';
import 'package:app/utils/logger.dart';
import 'package:app/utils/network.dart';
import 'package:dio/dio.dart';

class CommentsService {
  Future<List<CommentModel>> getComments(
      String postNo, String commentNo) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post-comment/$postNo/$commentNo');
    final response = await Dio().getUri(uri).catchError((e) {
      logger.e(e.message);
    });
    List<dynamic> dataList = response.data["list"];
    List<CommentModel> comments = List<CommentModel>.from(
        dataList.map((data) => CommentModel.fromJson(data)).toList());
    return comments;
  }
}
