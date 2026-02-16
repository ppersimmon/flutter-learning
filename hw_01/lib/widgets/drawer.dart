import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hw_01/generated/locale_keys.g.dart';
import 'package:hw_01/mock_data/user_profile.dart';

import '../pages/account.dart';
import '../utils/constants.dart';
import 'app_icon.dart';
import 'user_avatar.dart';

class NavDrawer extends StatelessWidget {
  final UserProfile user;
  const NavDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CColors.grey50,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CColors.grey50),
            accountName: Text(
              user.profileName,
              style: TextStyle(
                color: CColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              user.userName,
              style: TextStyle(
                color: CColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: UserAvatar(),
          ),

          ListTile(
            leading: const AppIcon(icon: Icons.person_outline),
            title: Text(LocaleKeys.title_profile.tr()),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AccountPage()));
            },
          ),
        ],
      ),
    );
  }
}
