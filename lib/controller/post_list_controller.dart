import 'package:app/model/postModel.dart';
import 'package:app/utils/logger.dart';
import 'package:dio/dio.dart';
import '../utils/network.dart';

class PostListController {
  final String stockCode;

  PostListController({required this.stockCode});

  Future<List<PostModel>> fetchData() async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/$stockCode/posts');
    final response = await Dio().getUri(uri).catchError((e) {
      logger.e(e.message);
    });
    List<dynamic> dataList = response.data["list"];
    List<PostModel> postList = List<PostModel>.from(
        dataList.map((data) => PostModel.fromJson(data)).toList());
    return postList;
  }
}
