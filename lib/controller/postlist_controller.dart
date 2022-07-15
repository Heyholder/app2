import 'dart:convert';
import 'package:app/network.dart';
import 'package:get/get.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class PostListController extends GetxController {
  var posts = <PostModel>[].obs;
  String stockCode = "000000";

  @override
  void onInit() {
    super.onInit();
    fetchData(stockCode);
  }

  void fetchData(String stockCode) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/$stockCode/posts');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var dataList = jsonDecode(response.body)["list"];
      List<PostModel> postList =
          List<PostModel>.from(dataList.map((data) => PostModel.fromJson(data)).toList());
      posts.assignAll(postList);
    } else {
      print(response.statusCode);
    }
  }
}
