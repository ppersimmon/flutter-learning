import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_01/generated/locale_keys.g.dart';
import 'package:hw_01/mock_data/user_profile.dart';
import 'package:hw_01/models/theme_model.dart';
import 'package:provider/provider.dart';

import '../router/app_router.dart';
import 'app_icon.dart';
import 'user_avatar.dart';

class NavDrawer extends StatelessWidget {
  final UserProfile user;
  const NavDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeModel>(context);

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  accountName: Text(
                    user.profileName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    user.userName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture: UserAvatar(),
                ),

                ListTile(
                  leading: const AppIcon(icon: Icons.person_outline),
                  title: Text(LocaleKeys.title_profile.tr()),
                  onTap: () {
                    context.pop();
                    context.pushNamed(AppPages.account.name);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: AppIcon(
              icon: themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            onTap: () {
              themeState.setDarkTheme = !themeState.getDarkTheme;
            },
          ),
        ],
      ),
    );
  }
}
