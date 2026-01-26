import 'package:flutter/material.dart';
import 'user_avatar.dart';

class AccountHeader extends StatelessWidget {
  final double avatarRadius;

  const AccountHeader({super.key, required this.avatarRadius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(color: Colors.white),
        Positioned.fill(
          bottom: avatarRadius / 2 + 20,
          child: Container(
            color: Colors.blue,
            child: Image.asset(
              'assets/images/app_bar_bg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: UserAvatar(radius: avatarRadius),
        ),
      ],
    );
  }
}