import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  final String? avatarImgUrl;

  const UserAvatar({
    super.key,
    this.radius = 50.0,
    this.avatarImgUrl,
});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius - 4,
        backgroundImage: avatarImgUrl != null
            ? AssetImage(avatarImgUrl!)
            : null,
        child: avatarImgUrl == null
            ? Icon(Icons.person, size: radius, color: Colors.grey)
            : null,
      ),
    );
  }
}