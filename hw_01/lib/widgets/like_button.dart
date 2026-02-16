import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_01/models/post_model.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import 'post_action_button.dart';

class LikeButton extends StatelessWidget {
  final String postId;

  const LikeButton({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostModel>(
      builder: (context, post, child) {
        final currentPost = post.posts.firstWhere((p) => p.id == postId);

        return PostActionButton(
          icon: currentPost.isLiked
              ? FontAwesomeIcons.solidHeart
              : FontAwesomeIcons.heart,
          color: currentPost.isLiked ? CColors.red : CColors.grey100,
          label: currentPost.likes.toString(),
          onTap: () {
            Provider.of<PostModel>(context, listen: false).switchLike(postId);
          },
        );
      },
    );
  }
}
