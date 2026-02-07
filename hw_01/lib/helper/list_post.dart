import 'package:flutter/material.dart';
import 'package:hw_01/mock_data/post.dart';
import 'package:hw_01/widgets/post_item.dart';

class ListPost extends StatelessWidget {
  final List<Post> posts;

  const ListPost({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(post: posts[index]);
      },
    );
  }
}
