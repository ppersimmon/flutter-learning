import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_01/generated/locale_keys.g.dart';

import '../mock_data/post.dart';
import 'like_button.dart';
import 'post_action_button.dart';

class PostActions extends StatelessWidget {
  final Post post;

  const PostActions({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PostActionButton(
          icon: FontAwesomeIcons.comment,
          label: post.commentCount.toString(),
        ),
        PostActionButton(
          icon: FontAwesomeIcons.retweet,
          label: post.reposts.toString(),
        ),
        LikeButton(postId: post.id),
        PostActionButton(
          icon: FontAwesomeIcons.chartSimple,
          label: post.views.toString(),
        ),
        PostActionButton(
          icon: FontAwesomeIcons.bookmark,
          label: LocaleKeys.empty_string.tr(),
        ),
        PostActionButton(
          icon: FontAwesomeIcons.shareNodes,
          label: LocaleKeys.empty_string.tr(),
        ),
      ],
    );
  }
}
