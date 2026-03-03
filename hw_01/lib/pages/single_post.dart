import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../generated/locale_keys.g.dart';
import '../mock_data/post.dart';
import '../utils/constants.dart';
import '../widgets/post_actions.dart';
import '../widgets/post_header.dart';
import '../widgets/post_media.dart';
import '../widgets/user_avatar.dart';

class SinglePostPage extends StatelessWidget {
  final Post post;

  const SinglePostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_post.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop('It was user ${post.author.profileName} post');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.p16),
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
