import 'package:flutter/material.dart';

import '../mock_data/post.dart';
import '../utils/constants.dart';
import 'post_actions.dart';
import 'post_header.dart';
import 'post_media.dart';
import 'user_avatar.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: CColors.grey100, width: 0.2)),
      ),
      padding: const EdgeInsets.all(Sizes.p12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(radius: Sizes.p24),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(post: post),
                gapH10,
                PostMedia(post: post),
                gapH12,
                PostActions(post: post),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
