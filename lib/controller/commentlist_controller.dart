import 'package:app/model/comment.dart';
import 'package:get/get.dart';
import 'package:app/network.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentListController extends GetxController {
  var comments = <CommentModel>[].obs;

   Future<void> fetchData(int postNo, int commentNo) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post-comment/$postNo/$commentNo');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body)["list"];
      List<CommentModel> commentList = List<CommentModel>.from(
          dataList.map((data) => CommentModel.fromJson(data)).toList());
      comments.assignAll(commentList);
    }
  }
}
