import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  final posts = <Post>[].obs;
  String stockCode = "000000";

  @override
  void onInit() {
    super.onInit();
    fetchData(stockCode);
  }

  void fetchData(String stockCode) async {
    String ip = "";
    if (Platform.isAndroid) {
      ip = "http://10.0.2.2:8080";
    } else if (Platform.isIOS) {
      ip = "http://127.0.0.1:8080";
    }

    final uri = Uri.parse('$ip/api/v1/$stockCode/posts');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Iterable dataList = jsonDecode(response.body)["list"];
      List<Post> postList =
          List<Post>.from(dataList.map((data) => Post.fromJson(data)).toList());
      posts.assignAll(postList);
    }
  }
}
