import 'dart:convert';
import 'package:app/model/comment.dart';
import 'package:app/model/post.dart';
import 'package:app/network.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostDetailController extends GetxController {
  final post = <PostModel>{}.obs;
  final comments = <CommentModel>[].obs;

  Future<void> fetchData(int postNo) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post/$postNo/2');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> commentData = jsonDecode(response.body)["list"];
      PostModel postData = PostModel.fromJson(data["body"]);
      List<CommentModel> commentList = List<CommentModel>.from(
          commentData.map((data) => CommentModel.fromJson(data)).toList());
      post.assign(postData);
      comments.assignAll(commentList);
    }
  }
}
