import 'dart:convert';
import 'package:blocmodules/src/post_app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> getPost() async {
    try {
      final res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (res.statusCode == 200) {
        var listData = jsonDecode(res.body) as List;
        return listData.map((value) => PostModel.fromJson(value)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
