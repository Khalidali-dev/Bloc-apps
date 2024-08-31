import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../src.dart';

class FilterRepository {
  Future<List<FilterModel>> getPost() async {
    try {
      final res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (res.statusCode == 200) {
        var listData = jsonDecode(res.body) as List;
        return listData.map((value) => FilterModel.fromJson(value)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
