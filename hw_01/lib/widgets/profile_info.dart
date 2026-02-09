import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hw_01/generated/locale_keys.g.dart';
import 'package:hw_01/mock_data/user_profile.dart';

import '../utils/constants.dart';

class ProfileInfo extends StatelessWidget {
  final UserProfile user;
  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH8,
          Text(
            user.profileName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          gapH8,
          Text(
            user.userName,
            style: TextStyle(fontSize: 16, color: CColors.grey100),
          ),
          gapH40,
          Row(
            children: [
              Icon(Icons.cake, size: Sizes.p16, color: CColors.grey100),
              gapW8,
              Text(
                LocaleKeys.profile_info_born_data.tr(
                  args: [user.bornDate ?? LocaleKeys.empty_string.tr()],
                ),
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: Sizes.p16,
                color: CColors.grey100,
              ),
              gapW8,
              Text(
                LocaleKeys.profile_info_join_data.tr(args: [user.joinDate]),
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: Sizes.p16,
                color: CColors.grey100,
              ),
            ],
          ),
          gapH12,
          Row(
            children: [
              Text(
                user.following.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: CColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW8,
              Text(
                LocaleKeys.following.tr(),
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
              gapW24,
              Text(
                user.followers.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: CColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW8,
              Text(
                LocaleKeys.followers.tr(),
                style: TextStyle(fontSize: 16, color: CColors.grey100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
