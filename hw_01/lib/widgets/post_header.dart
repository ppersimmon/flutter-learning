import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hw_01/generated/locale_keys.g.dart';

import '../helper/change_date_format.dart';
import '../mock_data/post.dart';
import '../utils/constants.dart';

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              post.author.profileName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            gapW4,
            Text(
              post.author.userName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              LocaleKeys.divider.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              post.createdAt.timeAgo,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            Icon(Icons.more_horiz, size: Sizes.p16, color: CColors.grey600),
          ],
        ),
        gapH4,
        Text(post.description, style: TextStyle(fontSize: 16, height: 1.3)),
      ],
    );
  }
}
