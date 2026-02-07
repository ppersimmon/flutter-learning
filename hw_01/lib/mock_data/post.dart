import 'user_profile.dart';

class Post {
  final UserProfile author;
  final DateTime createdAt;
  final String description;
  final String? image;
  final int commentCount;
  final int reposts;
  final int likes;
  final int views;

  const Post({
    required this.author,
    required this.createdAt,
    required this.description,
    this.image,
    this.commentCount = 0,
    this.reposts = 0,
    this.likes = 0,
    this.views = 0,
  });
}
