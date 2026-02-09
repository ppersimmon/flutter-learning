import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hw_01/generated/locale_keys.g.dart';

import '../helper/change_date_format.dart';
import '../mock_data/post.dart';
import '../utils/constants.dart';
import 'like_button.dart';
import 'post_action_button.dart';
import 'user_avatar.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function() setLike;

  const PostItem({super.key, required this.post, required this.setLike});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CColors.grey50,
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
                Row(
                  children: [
                    Text(
                      post.author.profileName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    gapW4,
                    Text(
                      post.author.userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      LocaleKeys.divider.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      post.createdAt.timeAgo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz,
                      size: Sizes.p16,
                      color: CColors.grey600,
                    ),
                  ],
                ),
                gapH4,
                Text(
                  post.description,
                  style: TextStyle(fontSize: 16, height: 1.3),
                ),
                gapH10,

                Container(
                  height: Sizes.p200,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Hero(
                    tag: post.author.image ?? CImage.defaultPostImage,
                    child: Material(
                      color: CColors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                backgroundColor: CColors.black,
                                body: Center(
                                  child: Hero(
                                    tag:
                                        post.author.image ??
                                        CImage.defaultPostImage,
                                    child: Image.asset(
                                      post.author.image ??
                                          CImage.defaultPostImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          post.author.image ?? CImage.defaultPostImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                gapH12,

                Row(
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
                    LikeButton(
                      likes: post.likes,
                      isLiked: post.isLiked,
                      onTap: setLike,
                    ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
