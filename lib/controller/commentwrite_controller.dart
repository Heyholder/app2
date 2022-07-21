import 'dart:convert';

import 'package:app/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CommentWriteController extends GetxController {
  Rx<TextEditingController> commentEditingController =
      TextEditingController().obs;

  Future<void> fetchData(data) async {
    String ip = "";
    ip = ipAddress();
    final uri = Uri.parse('$ip/api/v1/post-comment');
    http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(data),
    );
  }
}
