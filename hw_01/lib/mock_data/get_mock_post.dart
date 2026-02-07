import 'dart:async';

import 'mock_data.dart';
import 'post.dart';

abstract class PostStorage {
  Future<List<Post>> fetch();
}

class MockPostStorage implements PostStorage {
  @override
  Future<List<Post>> fetch() {
    return Future.value(postsExamples);
  }
}
