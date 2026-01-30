import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'user_avatar.dart';

class AccountHeader extends StatelessWidget {
  final double avatarRadius;

  const AccountHeader({super.key, required this.avatarRadius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(color: CColors.grey50),
        Positioned.fill(
          bottom: avatarRadius,
          child: Container(
            color: CColors.blue500,
            child: Image.asset(
              'assets/images/app_bar_bg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: Sizes.p12),
          child: UserAvatar(radius: avatarRadius),
        ),
      ],
    );
  }
}