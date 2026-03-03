import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../mock_data/post.dart';
import '../router/app_router.dart';
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final result = await context.pushNamed(
          AppPages.singlePost.name,
          extra: post,
        );
        if (result != null && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(result.toString())));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: CColors.grey100, width: 0.2),
          ),
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
      ),
    );
  }
}
