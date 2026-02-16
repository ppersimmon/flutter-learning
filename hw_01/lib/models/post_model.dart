import 'package:flutter/material.dart';
import 'package:hw_01/mock_data/mock_data.dart';

import '../mock_data/post.dart';

class PostModel extends ChangeNotifier {
  final List<Post> _posts = List.from(postsExamples);

  List<Post> get posts => _posts;

  void switchLike(String postId) {
    final index = _posts.indexWhere((p) => p.id == postId);
    if (index != -1) {
      final currentPost = _posts[index];
      final newIsLiked = !currentPost.isLiked;

      _posts[index] = currentPost.copyWith(
        isLiked: newIsLiked,
        likes: newIsLiked ? currentPost.likes + 1 : currentPost.likes - 1,
      );
      notifyListeners();
    }
  }
}
