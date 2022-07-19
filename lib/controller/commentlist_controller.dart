import 'package:app/model/comment.dart';
import 'package:get/get.dart';
import 'package:app/network.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentListController extends GetxController {
  final int postNo = 1;
  final int commentNo = 2;
  var comments = <CommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post-comment/$postNo/$commentNo');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var dataList = jsonDecode(response.body)["list"];
      List<CommentModel> postList = List<CommentModel>.from(
          dataList.map((data) => CommentModel.fromJson(data)).toList());
      comments.assignAll(postList);
    } else {
      print(response.statusCode);
    }
  }
}
