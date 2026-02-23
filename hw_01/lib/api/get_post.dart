import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hw_01/mock_data/get_mock_post.dart';
import 'package:hw_01/mock_data/post.dart';

class ApiPostStorage implements PostStorage {
  @override
  Future<List<Post>> fetch() async {
    final baseURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(
      baseURL,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error status: ${response.statusCode}');
    }
  }
}
