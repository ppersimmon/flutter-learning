import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/app_icon.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  final String? avatarImgUrl;

  const UserAvatar({super.key, this.radius = Sizes.p40, this.avatarImgUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: CircleAvatar(
        radius: radius - Sizes.p4,
        backgroundColor: CColors.avatarBg,
        backgroundImage: avatarImgUrl != null
            ? AssetImage(avatarImgUrl!)
            : null,
        child: avatarImgUrl == null
            ? AppIcon(icon: Icons.person, size: radius, color: CColors.grey100)
            : null,
      ),
    );
  }
}
