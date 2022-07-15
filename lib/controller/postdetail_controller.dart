import 'dart:convert';

import 'package:app/model/post.dart';
import 'package:app/network.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostDetailController extends GetxController {
  final int postNo = Get.arguments;
  var post = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/post/$postNo/2');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      PostModel postData = PostModel.fromJson(data["body"]);
      post.assign(postData);
    }
  }
}
