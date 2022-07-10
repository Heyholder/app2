import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var posts = <Post>[].obs;
  String stockCode = "dddddd";

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
      print(response.body);
    }
  }
}
