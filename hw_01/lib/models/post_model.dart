import 'package:flutter/material.dart';

import '../api/get_post.dart';
import '../mock_data/get_mock_post.dart';
import '../mock_data/post.dart';

class PostModel extends ChangeNotifier {
  final PostStorage _storage = ApiPostStorage();

  List<Post> _posts = [];
  bool _isLoading = false;
  String? _errorMsg;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get errorMsg => _errorMsg;

  PostModel() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMsg = null;
    notifyListeners();

    try {
      _posts = await _storage.fetch();
    } catch (error) {
      _errorMsg = 'Failed to load posts';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
