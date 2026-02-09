import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';
import 'post_action_button.dart';

class LikeButton extends StatelessWidget {
  final int likes;
  final bool isLiked;
  final Function()? onTap;

  const LikeButton({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PostActionButton(
      icon: isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
      color: isLiked ? CColors.red : CColors.grey100,
      label: likes.toString(),
      onTap: onTap,
    );
  }
}
