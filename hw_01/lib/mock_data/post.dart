import 'user_profile.dart';

class Post {
  final String id;
  final UserProfile author;
  final DateTime createdAt;
  final String description;
  final String? image;
  final int commentCount;
  final int reposts;
  final int likes;
  final int views;
  final bool isLiked;

  const Post({
    required this.id,
    required this.author,
    required this.createdAt,
    required this.description,
    this.image,
    this.commentCount = 0,
    this.reposts = 0,
    this.likes = 0,
    this.views = 0,
    this.isLiked = false,
  });

  Post copyWith({
    String? id,
    UserProfile? author,
    DateTime? createdAt,
    String? description,
    String? image,
    int? commentCount,
    int? reposts,
    int? likes,
    int? views,
    bool? isLiked,
  }) {
    return Post(
      id: id ?? this.id,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      image: image ?? this.image,
      commentCount: commentCount ?? this.commentCount,
      reposts: reposts ?? this.reposts,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
